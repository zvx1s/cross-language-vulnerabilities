// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

/// @title FixedTypeMismatch
/// @notice Validates inputs before downcasting to avoid truncation collisions.
contract FixedTypeMismatch {
    mapping(uint160 => address) public ownerOf;

    /// Store owner only after validating the id fits in uint160.
    function register(uint256 id) external {
        // Ensure no high bits will be lost when we cast
        require(id <= type(uint160).max, "ID_TOO_LARGE");
        uint160 shortId = uint160(id);
        ownerOf[shortId] = msg.sender;
    }

    function getOwner(uint256 id) external view returns (address) {
        // same access pattern but register enforces safety
        return ownerOf[uint160(id)];
    }
}
