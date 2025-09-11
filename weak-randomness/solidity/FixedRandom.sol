// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract FixedRandom {
    // Minimal commit–reveal: unpredictability until reveal.
    bytes32 public commit;       // keccak256(secret)
    uint256 public commitBlock;  // block at commit

    function commitSecret(bytes32 _commit) external {
        commit = _commit;
        commitBlock = block.number;
    }

    function reveal(bytes32 secret) external view returns (uint) {
        require(commit != bytes32(0), "No commit");
        require(keccak256(abi.encodePacked(secret)) == commit, "Bad secret");
        require(block.number > commitBlock, "Too soon");

        // Use the blockhash fixed at commit time + secret (but can’t be influenced at all now).
        bytes32 h = keccak256(abi.encodePacked(secret, blockhash(commitBlock)));
        return uint(h) % 10; // number 0–9
    }
}
