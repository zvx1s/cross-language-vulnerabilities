# Type Mismatch(Integer Truncation)

This demo shows a common type-mismatch vulnerability: silently downcasting a large integer (e.g. `uint256`) to a smaller type (e.g. `uint160`). Solidity truncates high-order bits when you cast to a smaller unsigned integer, which can cause collisions or logic bypasses.

## Purpose
- Demonstrate truncation with a minimal vulnerable contract.
- Show the safe fix: validate before downcasting.
- Give a compact example you can compile and test.

## Vulnerable version
`VulnerableTypeMismatch.sol` stores external IDs/values using an unsafe downcast from `uint256` → `uint160`. Two distinct `uint256` inputs that share the same low 160 bits will collide in storage.

## Fixed version
`FixedTypeMismatch.sol` uses `require(x <= type(uint160).max)` before casting, preventing truncation.

## How to run (Foundry)
1. Put files under `solidity/type-mismatch/`.
2. Compile and test:
