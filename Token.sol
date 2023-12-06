//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


contract Token {
    string public name = "Token_Name";
    string public symbol = "Token Symbol";

    // The fixed amount of tokens, stored in an unsigned integer type variable.
    uint256 public totalSupply = 21000000;

    // An address type variable is used to store ethereum accounts.
    address public owner;

    // A mapping is a key/value map. Here we store each account's balance.
    mapping(address => uint256) balances;

    // The Transfer event helps off-chain applications understand
    // what happens within your contract.
    event Transfer(address indexed _from, address indexed _to, uint256 _value);


    constructor() {
    balances[msg.sender] = totalSupply;
    owner = msg.sender;
    }

    function transfer(address to, uint256 amount) external {
    require(balances[msg.sender] >= amount, "Not enough tokens");

    // Transfer the amount.
    balances[msg.sender] -= amount;
    balances[to] += amount;

    // Notify off-chain applications of the transfer.
    emit Transfer(msg.sender, to, amount);
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}

