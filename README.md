# MyToken ERC20 Contract

## Overview

This repository contains a Solidity smart contract for an ERC20 token called "ETH AVAX" (symbol: ETHVX). 
The contract allows users to mint, burn, transfer, and approve tokens. It implements the standard ERC20 functionality with additional features for minting and burning tokens.

## Features

- **Minting:** Create new tokens and assign them to a specific address.
- **Burning:** Remove tokens from a specified address and decrease the total supply.
- **Transfer:** Transfer tokens between addresses.
- **Approval:** Approve another address to spend tokens on behalf of the owner.
- **TransferFrom:** Transfer tokens from one address to another using an approved allowance.

## Contract Details

### Contract Address

The contract can be deployed on any Ethereum-compatible network. Make sure to replace the placeholder address in your deployment script.

### Events

- `Transfer(address indexed from, address indexed to, uint value)`: Emitted when tokens are transferred.
- `Approval(address indexed owner, address indexed spender, uint value)`: Emitted when tokens are approved for spending.

### Functions

- `mint(address _address, uint _value)`: Mints new tokens and assigns them to `_address`.
- `burn(address _address, uint _value)`: Burns tokens from `_address` and reduces the total supply.
- `transfer(address _to, uint _value)`: Transfers tokens from the caller to `_to`.
- `approve(address _spender, uint _value)`: Approves `_spender` to spend `_value` tokens on behalf of the caller.
- `transferFrom(address _from, address _to, uint _value)`: Transfers tokens from `_from` to `_to` using an approved allowance.

## Usage

1. **Deploying the Contract:**

   You can deploy this contract using Remix, HardHat, or any Ethereum development environment. Make sure you have sufficient ETH in your account to deploy and interact with the contract.

2. **Interacting with the Contract:**

   - **Mint Tokens:** Call the `mint` function to create new tokens.
   - **Burn Tokens:** Call the `burn` function to remove tokens from an address.
   - **Transfer Tokens:** Use the `transfer` function to send tokens to another address.
   - **Approve Spending:** Call `approve` to allow another address to spend tokens on your behalf.
   - **Transfer From:** Use `transferFrom` to transfer tokens from one address to another with an approved allowance.

## Installation

To deploy and interact with this contract, follow these steps:

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yourusername/your-repo-name.git
   ```

2. **Navigate to the Project Directory:**

   ```bash
   cd your-repo-name
   ```

3. Install Dependencies:

   Make sure you have Node.js and HardHat installed. Then run:

   ```bash
   npm install
   ```

5. **Deploy The Contract:**
   Use HardHat or another tool to deploy the contract to your preferred network. Example command for HardHat:

   ```bash
   npx hardhat run scripts/deploy.js --network <network_name>
   ```

## Author

Marx Lizardo  
[LinkedIn](https://www.linkedin.com/in/marxjbl/) 
