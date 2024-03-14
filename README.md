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

## Deployment Information
### BNB Mainnet
- **ACT**:
    - Deployed at: `0x2de33F9DC49Ab68775160921E043d7DFC4BBB2B7`
    - Owner: `0x000c60CC125272938986077784EB41B7Cc537Ab8`
    - Creation: https://bscscan.com/tx/0x4e92b436bb19ad59089e7d412902584abbcbcc84c3890f1a40af3d202ce6d20b
    - Token Explorer: https://bscscan.com/token/0x2de33f9dc49ab68775160921e043d7dfc4bbb2b7
    - Verified Detail:
        - Verified with solc 0.8.6 + optimizer=true 200  + flatten
        - Constructor: 
        - Tool: `cast abi-encode "x(address,uint256)"`
    - Basic Info:
        - Decimal: 18
    
- **BSC-USD**:
    - Deployed at: `0x55d398326f99059fF775485246999027B3197955`
    - Owner: `0x970609bA2C160a1b491b90867681918BDc9773aF`
    - Creation: https://bscscan.com/tx/0x05ec6203d7d0d8794449e4d8393c4e3cc397f2477839248e16db25469e37721d
    - Token Explorer: https://bscscan.com/token/0x55d398326f99059ff775485246999027b3197955
    - Verified Detail:
        - Verified with solc 0.5.16 + optimizer=true 200  + flatten
        - Constructor: 
        - Tool: `cast abi-encode "x(address,uint256)"`
    - Basic Info:
        - Decimal: 18
    

- **PancakeSwap**:
    - Website: https://pancakeswap.finance/?chainId=97
    - Creation: https://bscscan.com/tx/0xbf20ddc24442f9e5c08dd924de4d274b875ef4e4f6fee9b48d5c5b3a86531d41
    - Pair address: `0x540a6271a8f9BB5F9dcDB7C64c7ca2a4d9621928`

### BNB Testnet
- **ACT**:
    - Deployed at: `0xB164cdd83b5d07ED91cd3E09Be983d5fee86C6DA`
    - Owner:  `0x46594bb57b9CcA5a4B2c968E3A4bAFb258587308`
    - Creation: https://testnet.bscscan.com/tx/0xd03b8b3af0e29de8feeb8236f6c14deb3a16afebd7433a93574253a5789cdeea
    - Token Explorer: https://testnet.bscscan.com/token/0xb164cdd83b5d07ed91cd3e09be983d5fee86c6da
    - Verified Detail:
        - Verified with solc 0.8.6 + optimizer=true 200 + flatten
        - Constructor: 
        - Tool: `cast abi-encode "x(address,uint256)"`
        - ABI Encoder https://abi.hashex.org/
    - Basic Info:
        - Decimal: 18

- **USDA**:
    - Deployed at: `0xffBfE5fcbecED10b385601Cc78fECfc33BeE237b`
    - Owner:  `0x46594bb57b9CcA5a4B2c968E3A4bAFb258587308`
    - Creation: https://testnet.bscscan.com/tx/0x3f697338e128d33dd0c6a32474d2e174d959c51808773ffd8068a555a4c73a93
    - Token Explorer: https://testnet.bscscan.com/token/0xffbfe5fcbeced10b385601cc78fecfc33bee237b
    - Verified Detail:
        - Verified with solc 0.8.6 + optimizer=true 200 + flatten
        - Constructor: 
        - Tool: `cast abi-encode "x(address,uint256)"`
        - ABI Encoder https://abi.hashex.org/
    - Basic Info:
        - Decimal: 18

- **PancakeSwap**:
    - Website: https://pancake.kiemtienonline360.com/#/swap
    - Creation: https://testnet.bscscan.com/tx/0xbd74fc9f8dba782f8b9ac639e3456e0908a95cd24dfe8b1690bfcb2ed412e875
    - Pair address: `0xe58eE18d5c232181293c7Cd6C84d8b5f469704b7`

- **SendMany**:
    - Deployed at: `0x13cccd645eeb01ce10e0ba276035451d21e18ea8`
    - Creation: https://testnet.bscscan.com/tx/0x610ebc9349b1a87a3055b3114da2f9b7ed3d1f9d3aac8c4b07b4e0b92bcf6ef8


### Goerli(ETH) Testnet
- **USDA**:
    - Deployed at: `0x4845D30D9B907BA5353724BE1260BC1Eb857cdA3`
    - Owner: `0x7538ca394554cfbed136dbd81f0b3cbe7b496540`
    - Creation: https://goerli.etherscan.io/tx/0x2ddb165d37b495c5127e0b7266876b633afed0416e870f2e517a3b96f6726293
    - Token Explorer: https://goerli.etherscan.io/token/0x4845D30D9B907BA5353724BE1260BC1Eb857cdA3
    - Basic Info:
        - Decimal: 6

- **SendMany**:
    - Deployed at: `0xf5481f606FA9A35Be9ac4166bdd997F202D04507`
    - Creation: https://goerli.etherscan.io/tx/0x6c1af94b1bcc84149240055d11ce57b16f8aa935537d66d9f823932043f12d84


### Shasta(TRON) Testnet
- **USDA**:
    - Deployed at: `TVn5PASeibyEkNgGn7KzmHC5FYt6Knrk7d    (0xd9479486081278a1a626262082ea2042648687cb)`
    - Owner: `TGPBGs3yybwDkTtmT5AwUjXe6Q4NbGMzwa    (0x46594bb57b9CcA5a4B2c968E3A4bAFb258587308)`
    - Creation: https://shasta.tronscan.io/#/transaction/a9f777d6da47b76ee876d0472756933e31fc572bd05801cca78817529a74a547
    - Token Explorer: https://shasta.tronscan.io/#/token20/TVn5PASeibyEkNgGn7KzmHC5FYt6Knrk7d
    - Basic Info:
        - Decimal: 6

- **SendMany**:
    - Deployed at:  `TNzsFdiRp9vXJbMHM2tanTkHyFzLztZmN7    (0x8ee9fb51fd3e3a457029e35b99a4648070bda9f5)`
    - Creation: https://shasta.tronscan.io/#/transaction/f8bccf6dbee57d801f05d9443e66b1325b83e53ed38902e6fe8d3361b23757ac

### Amoy(Polygon) Testnet
- **USDA**:
    - Deployed at: `0xe1f526D32E05697b68B518f4a7dEa4A2dD0Ad4C0`
    - Owner:  `0x798d4Ba9baf0064Ec19eB4F0a1a45785ae9D6DFc`
    - Creation: https://www.oklink.com/amoy/tx/0x87b7bf0b9c22f9188e704da3f851692910785d1822974deeed4a5a3ed8af465f
    - Token Explorer: https://www.oklink.com/amoy/address/0xe1f526d32e05697b68b518f4a7dea4a2dd0ad4c0
    - Verified Detail:
        - Verified with solc 0.8.6 + optimizer=true 200 + flatten
        - Constructor: 
        - Tool: `cast abi-encode "x(address,uint256)"`
        - ABI Encoder https://abi.hashex.org/
    - Basic Info:
        - Decimal: 6

- **SendMany**:
    - Deployed at: `0xE915706c75C237789eFCD7fE6b284931c8376E7c`
    - Creation: https://www.oklink.com/amoy/tx/0x8f73e27a6381e233c916df4d043760958145b289a8d0f287c12c7ad0ce39bcf3

### Mumbai(Polygon) Testnet(Deprecated)
- **ACT**:
    - Deployed at: `0x61C590cA0FF6DF620F84E6cB7C92B208Df7a588f`
    - Owner:  `0x46594bb57b9CcA5a4B2c968E3A4bAFb258587308`
    - Creation: https://mumbai.polygonscan.com/tx/0x7ce1d02031e9d2f530df760847f98d7910c98dee2d240e3464a79ccf359352e9
    - Token Explorer: https://mumbai.polygonscan.com/address/0x61c590ca0ff6df620f84e6cb7c92b208df7a588f
    - Verified Detail:
        - Verified with solc 0.8.6 + optimizer=true 200 + flatten
        - Constructor: 
        - Tool: `cast abi-encode "x(address,uint256)"`
        - ABI Encoder https://abi.hashex.org/
    - Basic Info:
        - Decimal: 6

- **USDA**:
    - Deployed at: `0xD7C7f1a7fA64a5Ff036952Fd5e0a225cd2b766FB`
    - Owner:  `0x46594bb57b9CcA5a4B2c968E3A4bAFb258587308`
    - Creation: https://mumbai.polygonscan.com/tx/0x6811e3b0318b572d177b3bdf590c1171f1e9778bdb738818b588aaf8c1f05bcb
    - Token Explorer: https://mumbai.polygonscan.com/address/0xd7c7f1a7fa64a5ff036952fd5e0a225cd2b766fb
    - Verified Detail:
        - Verified with solc 0.8.6 + optimizer=true 200 + flatten
        - Constructor: 
        - Tool: `cast abi-encode "x(address,uint256)"`
        - ABI Encoder https://abi.hashex.org/
    - Basic Info:
        - Decimal: 6

- **SendMany**:
    - Deployed at: `0x13bcb4B58926096858E2e51dD3f156826e140b0c`
    - Creation: https://mumbai.polygonscan.com/tx/0x3141578e687f1bf4a22cf7e7308dd47d6f83097a87a8e2533826115883b4e3f4