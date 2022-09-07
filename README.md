# ACT Token Contracts 

## Project Structure

```tree
├── justfile                        ; All Scripts and Pipelines
├── lib                             ; Third party solidity dependencies
├── remappings.txt                  ; Solidity library path remappings
├── scripts                         ; Tooling
└── src                             ; Smart Contracts
    ├── ACTTokenBNB.sol             ; Modern Solidity ERC20 Token for BNB
    └── test                        ; Customized Unit Tests
        └── ACTToken.t.sol
```

## Dependencies

- Docker
- Nodejs
- Yarn
- Curl

## Getting Started

### Development

Development should occur in "./src" and "./src/test".  

```sh
# Download dependencies
just deps

# Build the Smart Contracts
just build

# Run the HEVM Unit Tests
just test

# Export the ABI's "./out" and "/frontend/src"
just abi-out
```

### Local Deployment

```sh
# starts a local aminox testnet (requires docker)
just testnet

# deploy Payments.sol to Local testnet
just deploy-testnet
```

## Deployment

### BNB Mainnet
- ACT:
    - Deployed at: `0x2de33F9DC49Ab68775160921E043d7DFC4BBB2B7`
    - Owner: `0x000c60CC125272938986077784EB41B7Cc537Ab8`
    - Creation: https://bscscan.com/tx/0x4e92b436bb19ad59089e7d412902584abbcbcc84c3890f1a40af3d202ce6d20b
    - Token Explorer: https://bscscan.com/token/0x2de33f9dc49ab68775160921e043d7dfc4bbb2b7

    - Verified with solc 0.8.6 + optimizer=true 200  + flatten
    - Constructor: 
    - Tool: `cast abi-encode "x(address,uint256)"`
    
- BSC-USD:
    - Deployed at: `0x55d398326f99059fF775485246999027B3197955`
    - Owner: `0x970609bA2C160a1b491b90867681918BDc9773aF`
    - Creation: https://bscscan.com/tx/0x05ec6203d7d0d8794449e4d8393c4e3cc397f2477839248e16db25469e37721d
    - Token Explorer: https://bscscan.com/token/0x55d398326f99059ff775485246999027b3197955

    - Verified with solc 0.5.16 + optimizer=true 200  + flatten
    - Constructor: 
    - Tool: `cast abi-encode "x(address,uint256)"`

- PancakeSwap
    - Website: https://pancakeswap.finance/?chainId=97
    - Creation: https://bscscan.com/tx/0xbf20ddc24442f9e5c08dd924de4d274b875ef4e4f6fee9b48d5c5b3a86531d41
    - Pair address: `0x540a6271a8f9BB5F9dcDB7C64c7ca2a4d9621928`

### BNB Testnet
- ACT:
    - Deployed at: `0xB164cdd83b5d07ED91cd3E09Be983d5fee86C6DA`
    - Owner:  `0x46594bb57b9CcA5a4B2c968E3A4bAFb258587308`
    - Creation: https://testnet.bscscan.com/tx/0xd03b8b3af0e29de8feeb8236f6c14deb3a16afebd7433a93574253a5789cdeea
    - Token Explorer: https://testnet.bscscan.com/token/0xb164cdd83b5d07ed91cd3e09be983d5fee86c6da

    - Verified with solc 0.8.6 + optimizer=true 200 + flatten
    - Constructor: 
    - Tool: `cast abi-encode "x(address,uint256)"`
    - ABI Encoder https://abi.hashex.org/

- USDA:
    - Deployed at: `0xffBfE5fcbecED10b385601Cc78fECfc33BeE237b`
    - Owner:  `0x46594bb57b9CcA5a4B2c968E3A4bAFb258587308`
    - Creation: https://testnet.bscscan.com/tx/0x3f697338e128d33dd0c6a32474d2e174d959c51808773ffd8068a555a4c73a93
    - Token Explorer: https://testnet.bscscan.com/token/0xffbfe5fcbeced10b385601cc78fecfc33bee237b

    - Verified with solc 0.8.6 + optimizer=true 200 + flatten
    - Constructor: 
    - Tool: `cast abi-encode "x(address,uint256)"`
    - ABI Encoder https://abi.hashex.org/

- PancakeSwap
    - Website: https://pancake.kiemtienonline360.com/#/swap
    - Creation: https://testnet.bscscan.com/tx/0xbd74fc9f8dba782f8b9ac639e3456e0908a95cd24dfe8b1690bfcb2ed412e875
    - Pair address: `0xe58eE18d5c232181293c7Cd6C84d8b5f469704b7`
