// SPDX-License-Identifier: MIT

use std::time::{SystemTime, UNIX_EPOCH};

pub struct VulnerableLottery {
    players: Vec<String>,
}

impl VulnerableLottery {
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
        // This is a weak randomness: uses timestamp
        let now = SystemTime::now()
            .duration_since(UNIX_EPOCH)
            .unwrap()
            .as_secs();
        let index = (now as usize) % self.players.len();
        Some(&self.players[index])
    }
}
