# Reentrancy #1 in Soldiity

A minimal example of how reentrancy works and how to prevent it using the
Checks–Effects–Interactions (CEI) pattern.

### Vulnerable version
`VulnerableBank.sol` lets users withdraw before updating their balance.  
This means an attacker can re-enter through their fallback function and drain funds.

### Fixed version
`FixedBank.sol` updates the balance before sending ETH.  
With state updated first, any re-entrant call will fail the balance check.

### Key idea
Always apply **CEI**:
1. Check conditions  
2. Update state (effects)  
3. Interact with external addresses last

# Reentrancy (Basic) — Solidity
This is a short demo showing how withdrawing before updating state allows reentrancy.
How to run:
- `forge test --match-path test/PuppyRaffleTest.t.sol`
Files:
- `VulnerableBank.sol` — vulnerable
- `FixedBank.sol` — CEI fix

