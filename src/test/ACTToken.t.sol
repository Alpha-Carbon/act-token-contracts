// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "ds-test/test.sol";
import "../ACTTokenBNB.sol";

interface HEVM {
    function warp(uint256) external;
    // Set block.timestamp

    function roll(uint256) external;
    // Set block.number

    function fee(uint256) external;
    // Set block.basefee

    function load(address account, bytes32 slot) external returns (bytes32);
    // Loads a storage slot from an address

    function store(address account, bytes32 slot, bytes32 value) external;
    // Stores a value to an address' storage slot

    function sign(uint256 privateKey, bytes32 digest) external returns (uint8 v, bytes32 r, bytes32 s);
    // Signs data

    function addr(uint256 privateKey) external returns (address);
    // Computes address for a given private key

    function ffi(string[] calldata) external returns (bytes memory);
    // Performs a foreign function call via terminal

    function prank(address) external;
    // Sets the *next* call's msg.sender to be the input address

    function startPrank(address) external;
    // Sets all subsequent calls' msg.sender t be the input address until `stopPrank` is called

    function prank(address, address) external;
    // Sets the *next* call's msg.sender to be the input address, and the tx.origin to be the second input

    function startPrank(address, address) external;
    // Sets all subsequent calls' msg.sender to be the input address until `stopPrank` is called, and the tx.origin to be the second input

    function stopPrank() external;
    // Resets subsequent calls' msg.sender to be `address(this)`

    function deal(address who, uint256 newBalance) external;
    // Sets an address' balance

    function etch(address who, bytes calldata code) external;
    // Sets an address' code

    function expectRevert(bytes calldata) external;
    function expectRevert(bytes4) external;
    // Expects an error on next call

    function record() external;
    // Record all storage reads and writes

    function accesses(address) external returns (bytes32[] memory reads, bytes32[] memory writes);
    // Gets all accessed reads and write slot from a recording session, for a given address

    function expectEmit(bool, bool, bool, bool) external;
    // Prepare an expected log with (bool checkTopic1, bool checkTopic2, bool checkTopic3, bool checkData).
    // Call this function, then emit an event, then call a function. Internally after the call, we check if
    // logs were emitted in the expected order with the expected topics and data (as specified by the booleans)

    function mockCall(address, bytes calldata, bytes calldata) external;
    // Mocks a call to an address, returning specified data.
    // Calldata can either be strict or a partial match, e.g. if you only
    // pass a Solidity selector to the expected calldata, then the entire Solidity
    // function will be mocked.

    function clearMockedCalls() external;
    // Clears all mocked calls

    function expectCall(address, bytes calldata) external;
    // Expect a call to an address with the specified calldata.
    // Calldata can either be strict or a partial match

    function getCode(string calldata) external returns (bytes memory);
    // Gets the bytecode for a contract in the project given the path to the contract.

    function label(address addr, string calldata label) external;
    // Label an address in test traces

    function assume(bool) external;
    // When fuzzing, generate new inputs if conditional not met
}

contract User {
	ACTTokenBNB internal atm;

    constructor(address _atm) {
        atm = ACTTokenBNB(_atm);
    }

	function setAtm(address _atm) public {
		atm = ACTTokenBNB(_atm);
	}

	function transfer(address to, uint256 value) public {
		atm.transfer(to, value);
	}

    receive() external payable {}
}

contract ACTTokenBNBTest is DSTest {
	HEVM hevm = HEVM(HEVM_ADDRESS);

	// solhint-disable-next-line var-name-mixedcase
    bytes32 private immutable _PERMIT_TYPEHASH =
        keccak256("Permit(address owner,address spender,uint256 value,uint256 nonce,uint256 deadline)");

	// contracts
	ACTTokenBNB internal atm;

	// users
    User internal owner;
    User internal banker;
    User internal alice;
    User internal bob;

	// EOA users
	address internal testAccount = address(0x003533CD36aC980768B510F5C57E00CE4c0229D5);
	uint256 internal testAccountKey = 0x9cbc61f079e82f0d9d3989a99f5cfe4aef68cbec8063b821fd41e994ea131c79;

    function setUp() public virtual {
        banker = new User(address(0x0));
		hevm.prank(address(banker));
		// 2_000_000 tokens with decimal of 18 
		atm = new ACTTokenBNB(address(banker), 2_000_000_000_000_000_000_000_000);
		hevm.prank(address(banker));

		banker.setAtm(address(atm));

        owner = new User(address(atm));
        alice = new User(address(atm));
        bob = new User(address(atm));

		// funding BNB
		banker.transfer(address(alice), 100_000);
		banker.transfer(address(bob), 100_000);
		banker.transfer(address(testAccount), 100_000);

		// initialize 

		// roll for fun 
		hevm.roll(1);
    }

    function testTokenSanity() public {
		uint256 denom = 10**atm.decimals();
		emit log_named_uint("denom", denom);
		emit log_named_uint("totalSupply", atm.totalSupply());
		emit log_named_uint("totalSupplyConverted", atm.totalSupply() / denom);

		assertEq(atm.totalSupply() / denom, 2_000_000);
		assertEq(atm.decimals(), 18);
		assertEq(keccak256(abi.encodePacked(atm.symbol())), keccak256("ACT"));
		assertEq(keccak256(abi.encodePacked(atm.name())), keccak256("Alpha Carbon Token"));
		assertTrue(atm.hasRole(atm.DEFAULT_ADMIN_ROLE(), address(banker)));
		assertTrue(atm.hasRole(atm.PAUSER_ROLE(), address(banker)));

		assertEq(atm.balanceOf(address(alice)), 100000);
    }

	function testTokenPauseBNB() public {
		hevm.prank(address(banker));
		atm.pause();

		try alice.transfer(address(bob), 10) { 
			fail(); 
		} catch Error(string memory error) {
		    assertEq(error, "Pausable: paused");
		}

		hevm.prank(address(banker));
		atm.unpause();

		alice.transfer(address(bob), 10);
	}

	function createPermitHash(address tokenOwner, address spender, uint256 value, uint256 deadline) public returns (bytes32) {
		uint256 nonce = atm.nonces(tokenOwner);
		emit log_named_uint("tokenOwner nonce", nonce);
		bytes32 structHash = keccak256(abi.encode(
            _PERMIT_TYPEHASH,
            tokenOwner,
            spender,
            value,
            nonce,
            deadline)
		);
		return keccak256(abi.encodePacked("\x19\x01", atm.DOMAIN_SEPARATOR(), structHash));
	}
}
