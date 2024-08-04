// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.5.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.5.0/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    constructor() ERC20("My Token", "MTK") {
        // Initialize the contract with the token name and symbol
    }

    // Override the _mint function to only allow the owner to mint tokens
    function _mint(address account, uint256 amount) internal override onlyOwner {
        super._mint(account, amount);
    }

    // Only allow the owner to burn tokens
    function burn(uint256 amount) public onlyOwner {
        _burn(msg.sender, amount);
    }

    // Function to mint the initial tokens
    function mintInitialTokens() public onlyOwner {
        _mint(msg.sender, 1000000 * 10**decimals());
    }
}
