// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract FixedBank {
    mapping(address => uint) public balances;

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) external {
        require(balances[msg.sender] >= amount);
        balances[msg.sender] -= amount;           // effects first
        (bool ok,) = msg.sender.call{value: amount}(""); // interaction last
        require(ok);
    }
}
