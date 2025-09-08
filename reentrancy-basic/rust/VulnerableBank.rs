use std::collections::HashMap;

pub struct VulnerableBank {
    pub balances: HashMap<String, u64>,
}

impl VulnerableBank {
    pub fn deposit(&mut self, who: &str, amount: u64) {
        *self.balances.entry(who.into()).or_default() += amount;
    }

    // Vulnerable: interaction before effects
    pub fn withdraw(&mut self, who: &str, amount: u64, attacker: &mut dyn FnMut()) {
        assert!(self.balances[who] >= amount);
        attacker(); // external call before balance update
        self.balances.insert(who.into(), self.balances[who] - amount);
    }
}
