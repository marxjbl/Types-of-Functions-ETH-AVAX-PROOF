# MyToken (MTK) Smart Contract

This repository contains a Solidity smart contract for an ERC20 token named MyToken (MTK). The contract allows the owner to mint and burn tokens and follows the ERC20 standard provided by OpenZeppelin.

## Features

- ERC20 compliant token.
- Initial supply of 1 million tokens minted to the contract owner.
- Only the owner can mint new tokens.
- Only the owner can burn tokens.

## Usage

### Interacting with the Contract

Once deployed, the contract provides several functions to interact with the MyToken (MTK) token.

#### Minting Tokens

The owner can mint new tokens to a specified address.

```solidity
function mint(address to, uint256 amount) public onlyOwner
```

#### Burning Tokens

The owner can burn a specified amount of tokens from their balance.

```solidity
function burn(uint256 amount) public onlyOwner
```

#### OpenZeppelin Contracts

This contract uses the OpenZeppelin library for the ERC20 implementation and access control.

ERC20: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.5.0/contracts/token/ERC20/ERC20.sol

Ownable: https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.5.0/contracts/access/Ownable.sol

## Author

Marx Lizardo  
[LinkedIn](https://www.linkedin.com/in/marxjbl/)
