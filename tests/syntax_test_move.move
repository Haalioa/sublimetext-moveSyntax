// SYNTAX TEST "Move.sublime-syntax"
address 0x1 {
  module example::coin {
    use std::vector;
    friend 0x1::friend_mod;
    public struct Coin has copy, drop, store, key { value: u64, }
    const MAX: u64 = 1_000u64;
    #[test_only]
    public entry fun mint(account: &signer, amount: u64): Coin acquires Coin {
      let mut supply: u64 = 0;
      let _name = b"COIN";
      let _hex = x"DE AD BE EF";
      if (amount > 0) { return Coin { value: amount }; }
      else { return Coin { value: 0 }; }
    }
    spec { ensures true; aborts_if false; }
  }
}
