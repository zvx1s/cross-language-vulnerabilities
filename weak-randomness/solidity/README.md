# Weak Randomness #1 in Solidity

A minimal example showing why **block data** is not a secure source of randomness and a tiny
**commit–reveal** fix.

## Vulnerable version

`VulnerableRandom.sol` builds a number with:

```solidity
keccak256(abi.encodePacked(block.timestamp, blockhash(block.number - 1)))
