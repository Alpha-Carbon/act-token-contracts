// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "openzeppelin-contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "openzeppelin-contracts/token/ERC20/extensions/draft-ERC20Permit.sol";
import "openzeppelin-contracts/security/Pausable.sol";
import "openzeppelin-contracts/access/AccessControl.sol";

contract ACTTokenBNB is ERC20Burnable, Pausable, AccessControl, ERC20Permit {
    constructor(address owner, uint256 supply)
        ERC20("Alpha Carbon Token", "ACT")
        ERC20Permit("Alpha Carbon Token")
    {
        _grantRole(DEFAULT_ADMIN_ROLE, owner);
        _mint(owner, supply);
    }

    function decimals() public pure override returns (uint8) {
        return 18;
    }

    function pause() public onlyRole(DEFAULT_ADMIN_ROLE) {
        _pause();
    }

    function unpause() public onlyRole(DEFAULT_ADMIN_ROLE) {
        _unpause();
    }

    function mint(address owner, uint256 supply)
        public
        onlyRole(DEFAULT_ADMIN_ROLE)
    {
        _mint(owner, supply);
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, amount);
    }
}
