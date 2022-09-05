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

BNB Mainnet
- Deployed at:  
- Owner: 
- Creation: https://bscscan.com/tx/
- Token Explorer: https://bscscan.com/token/

- Verified with solc 0.8.6 + optimizer=true 200  + flatten
- Constructor: 
- Tool: `cast abi-encode "x(address,uint256)"`

BNB Testnet
- Deployed at: 
- Owner:  
- Creation: https://testnet.bscscan.com/tx/
- Token Explorer: https://testnet.bscscan.com/token/

- Verified with solc 0.8.10 + optimizer=true 200 + flatten
- Constructor: 
- Tool: `cast abi-encode "x(address,uint256)"`
- ABI Encoder https://abi.hashex.org/

