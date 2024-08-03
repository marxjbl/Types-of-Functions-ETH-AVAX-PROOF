// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.5.0/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor() ERC20("My Token", "MTK") {
        // Initialize the contract with the token name and symbol
        _mint(msg.sender, 1000000 * 10**decimals()); // Mint 1 million tokens to the contract owner
    }

    // Only allow the owner to mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Only allow the owner to burn tokens
    function burn(uint256 amount) public onlyOwner {
        _burn(msg.sender, amount);
    }
}
