set dotenv-load

# Path and Variables
ORG := "aetheras-io"
PROJECT := "banksy-rs"
REPO := "https://github.com" / ORG / PROJECT
ROOT_DIR := justfile_directory()
OUTPUT_DIR := ROOT_DIR / "out"
TESTNET_DIR := OUTPUT_DIR / "testnet"
TEST_ADDR := "0x003533CD36aC980768B510F5C57E00CE4c0229D5"
TEST_KEY := "0x9cbc61f079e82f0d9d3989a99f5cfe4aef68cbec8063b821fd41e994ea131c79" 
ALITH_ADDR := "0xf24FF3a9CF04c71Dbc94D0b566f7A27B94566cac"
ALITH_KEY := "0x5fb92d6e98884f76de468fa3f6278f8807c48bebc13595d45af5bdc4da702133"

#$(shell mkdir -p ${OUTPUT_DIR})

clean:
	forge clean

project-tree:
	tree -I 'lib|out|node_modules|cache|README*|*.lock|public|package.json|foundry.toml|tsconfig.json'

deps:
	curl -L https://foundry.paradigm.xyz | bash
	foundryup

# https://onbjerg.github.io/foundry-book/forge/dependencies.html
deps-oz:
	forge install openzeppelin/openzeppelin-contracts-upgradeable@v4.5.2
	forge install openzeppelin/openzeppelin-contracts@v4.5.0

# Build & test
build:
    forge build --extra-output metadata
test:
    forge test -vvvv 
flatten: 
	@forge flatten ./src/ACTTokenBNB.sol > ./out/ACTTokenBNB.flat.sol
# estimate :; ./scripts/estimate-gas.sh ${contract}
# size   :; ./scripts/contract-size.sh ${contract}
abi-out:
	jq '.abi' ./out/ACTTokenBNB.sol/ACTToken.json > ./out/ACTTokenBNBAbi.json
	# cp -r ./out/AminoTokenAbi.json ./frontend/src

testnet:
	docker run --rm -p 9944:9944 -p 9933:9933 --name amino-dev gcr.io/alpha-carbon/amino:v0.8.0 --dev --execution=native --ws-external --rpc-external --sealing 3000 -linfo,pallet_ethereum=trace,evm=trace


TESTNET_PARAMS := "--rpc-url http://localhost:9933 --private-key " + ALITH_KEY
TESTNET_CON_ARGS := ALITH_ADDR + " 10000000000000000"
deploy-testnet: (_deploy TESTNET_PARAMS TESTNET_CON_ARGS)

BNB_TESTNET_PARAMS := "-i --rpc-url https://data-seed-prebsc-2-s2.binance.org:8545 --gas-price 10000000000" 
deploy-bnb-testnet owner: (_deploy BNB_TESTNET_PARAMS owner + " 10000000000000000")

BNB_TESTNET_PARAMS := "-i --rpc-url https://bsc-dataseed.binance.org --gas-price 10000000000" 
deploy-bnb owner supply: (_deploy BNB_TESTNET_PARAMS owner + " " + supply)

_deploy params con_args:
    echo {{params}}
    echo {{con_args}}
    #@forge create {{params}} --legacy ACTTokenBNB --constructor-args {{con_args}}
