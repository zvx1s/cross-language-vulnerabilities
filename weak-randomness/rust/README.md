# Weak Randomness in Rust

A minimal example showing how insecure randomness can break a lottery system.

## Vulnerable version
`VulnerableLottery.rs` selects a winner using the current system timestamp.  
Since timestamps are predictable, an attacker could guess or manipulate the outcome.

## Fixed version
`FixedLottery.rs` uses Rust’s `rand` crate to generate a random index.  
This makes predicting the winner significantly harder.

## Key Idea
- Do not use timestamps or predictable values for randomness.  
- Use a secure randomness source (`rand`, verifiable randomness, oracles).  
