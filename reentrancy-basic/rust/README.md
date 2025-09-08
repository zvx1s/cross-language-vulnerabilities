# Reentrancy #1 in Rust

Minimal Rust example of a reentrancy issue:

- **VulnerableBank.rs**  
  Calls the attacker callback before updating balances.  
  The attacker can re-enter and drain more funds.

- **FixedBank.rs**  
  Updates balances first, then calls the attacker callback.  
  This follows the CEI pattern: **Checks → Effects → Interactions**.

The idea is identical to Solidity’s version: never give control to external
code before you’ve updated your own state.
