// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract VulnerableRandom {
    function draw() public view returns (uint) {
        // Anyone can predict this before the tx is completely mined.
        bytes32 h = keccak256(
            abi.encodePacked(block.timestamp, blockhash(block.number - 1))
        );
        return uint(h) % 10; // number 0–9
    }

    // Example “game”: guess what is today’s number.
    function guess(uint n) external view returns (bool) {
        return n == draw();
    }
}
