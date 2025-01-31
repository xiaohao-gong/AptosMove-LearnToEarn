module lazy_forever::faucet {
    use std::signer;
    use std::string;
    use aptos_framework::coin::{Self, MintCapability, BurnCapability, FreezeCapability, register, mint, deposit};

    struct Coin_lazy_forever {}
    struct Coin_lazy_forever_cap has key {
        mint_cap: MintCapability<Coin_lazy_forever>,
        burn_cap: BurnCapability<Coin_lazy_forever>,
        freeze_cap: FreezeCapability<Coin_lazy_forever>,
    }
    
    // 0x7fd1efdb3f312701da2ea01fb91fc5902bd2d4498c4220e9b6b13e400b5158c8
    // https://explorer.aptoslabs.com/txn/0xe02a9227fdb9578d96b04425fca23fe1716b867e8d20b7f9d4253999bc5c94b9?network=testnet
    fun init_module(account: &signer) {
        let (burn_cap, freeze_cap, mint_cap) = coin::initialize<Coin_lazy_forever>(
            account,
            string::utf8(b"Coin_lazy_forever"),
            string::utf8(b"lazyCoin"),
            8,
            true,
        );
        
        move_to(account, Coin_lazy_forever_cap {
            mint_cap: mint_cap,
            burn_cap: burn_cap,
            freeze_cap: freeze_cap,
        });
    }

    public entry fun faucet(account: &signer) acquires Coin_lazy_forever_cap {
        let cap = borrow_global<Coin_lazy_forever_cap>(@lazy_forever);

        if (!coin::is_account_registered<Coin_lazy_forever>(signer::address_of(account))) {
            register<Coin_lazy_forever>(account);
        };
        
        let coin = mint(100_000_000, &cap.mint_cap);
        
        deposit(signer::address_of(account), coin);

    }
}