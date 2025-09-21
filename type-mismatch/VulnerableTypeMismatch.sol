// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/// @title VulnerableTypeMismatch
/// @notice Stores a "token owner" mapping keyed by a truncated id (uint160).
contract VulnerableTypeMismatch {
    // mapping: truncated id => owner
    mapping(uint160 => address) public ownerOf;

    /// Store owner for a uint256 id after truncating to uint160 (unsafe).
    function register(uint256 id) external {
        // UNSAFE: truncates high bits, different ids may collide
        uint160 shortId = uint160(id);
        ownerOf[shortId] = msg.sender;
    }

    /// Read owner for an id (truncation applied the same way).
    function getOwner(uint256 id) external view returns (address) {
        return ownerOf[uint160(id)];
    }
}
