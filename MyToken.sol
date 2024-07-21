// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract MyToken is IERC20 {
    // Public variables
    string public tokenName = "ETH PROOF";
    string public tokenAbbrv = "ETHPRF";
    uint256 public override totalSupply;

    // Mapping variable to store balances of each address
    mapping(address => uint256) public balances;

    // Mapping variable to store allowances
    mapping(address => mapping(address => uint256)) public allowances;

    // Mint function with require statement
    function mint(address _address, uint256 _value) public {
        // Ensure that the provided address is not the zero address
        require(_address != address(0), "Invalid address");

        // Increase the total supply of tokens by the specified value
        totalSupply += _value;

        // Update the balance of the provided address by adding the specified value
        balances[_address] += _value;

        // Emit the Transfer event
        emit Transfer(address(0), _address, _value);
    }

    // Burn function with require, assert, and revert statements
    function burn(address _address, uint256 _value) public {
        // Check that the balance of the address is sufficient to burn the specified value
        require(balances[_address] >= _value, "Insufficient balance to burn");

        // Check that the total supply is sufficient to burn the specified value
        require(totalSupply >= _value, "Insufficient total supply to burn");

        // Reduce the balance of the specified address by the burn value
        balances[_address] -= _value;

        // Assert to ensure the total supply is correctly updated
        assert(totalSupply >= _value);

        // Reduce the total supply by the burn value
        totalSupply -= _value;

        // Emit the Transfer event
        emit Transfer(_address, address(0), _value);
    }

    // Transfer function
    function transfer(address _to, uint256 _value) public override returns (bool) {
        // Check that the balance of the sender is sufficient to transfer the specified value
        require(balances[msg.sender] >= _value, "Insufficient balance to transfer");

        // Reduce the balance of the sender by the transfer value
        balances[msg.sender] -= _value;

        // Increase the balance of the recipient by the transfer value
        balances[_to] += _value;

        // Emit the Transfer event
        emit Transfer(msg.sender, _to, _value);

        return true;
    }

    // Approve function
    function approve(address _spender, uint256 _value) public override returns (bool) {
        // Update the allowance of the spender
        allowances[msg.sender][_spender] = _value;

        // Emit the Approval event
        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    // TransferFrom function
    function transferFrom(address _from, address _to, uint256 _value) public override returns (bool) {
        // Check that the balance of the sender is sufficient to transfer the specified value
        require(balances[_from] >= _value, "Insufficient balance to transfer");

        // Check that the allowance of the spender is sufficient to transfer the specified value
        require(allowances[_from][msg.sender] >= _value, "Insufficient allowance to transfer");

        // Reduce the balance of the sender by the transfer value
        balances[_from] -= _value;

        // Reduce the allowance of the spender by the transfer value
        allowances[_from][msg.sender] -= _value;

        // Increase the balance of the recipient by the transfer value
        balances[_to] += _value;

        // Emit the Transfer event
        emit Transfer(_from, _to, _value);

        return true;
    }

    // Getter function for the balance of an address
    function balanceOf(address account) public view override returns (uint256) {
        return balances[account];
    }

    // Getter function for the allowance of a spender
    function allowance(address owner, address spender) public view override returns (uint256) {
        return allowances[owner][spender];
    }
}
