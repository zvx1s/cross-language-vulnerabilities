// FixedLottery.rs
// SPDX-License-Identifier: MIT

use rand::{thread_rng, Rng};

pub struct FixedLottery {
    players: Vec<String>,
}

impl FixedLottery {
    pub fn new() -> Self {
        Self { players: Vec::new() }
    }

    pub fn enter(&mut self, player: String) {
        self.players.push(player);
    }

    pub fn pick_winner(&self) -> Option<&String> {
        if self.players.is_empty() {
            return None;
        }
        // ✅ Stronger randomness: uses RNG
        let mut rng = thread_rng();
        let index = rng.gen_range(0..self.players.len());
        Some(&self.players[index])
    }
}
