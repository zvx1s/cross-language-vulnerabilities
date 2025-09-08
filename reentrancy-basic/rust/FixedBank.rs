use std::collections::HashMap;

pub struct FixedBank {
    pub balances: HashMap<String, u64>,
}

impl FixedBank {
    pub fn deposit(&mut self, who: &str, amount: u64) {
        *self.balances.entry(who.into()).or_default() += amount;
    }
    
    pub fn withdraw(&mut self, who: &str, amount: u64, attacker: &mut dyn FnMut()) {
        assert!(self.balances[who] >= amount);
        self.balances.insert(who.into(), self.balances[who] - amount);
        attacker(); // interaction last
    }
}
