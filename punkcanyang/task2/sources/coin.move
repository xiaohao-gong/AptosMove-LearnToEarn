module coin_punkcanyang::coin_punkcanyang {
    use std::string;
    use std::signer;
    use aptos_framework::coin::{Self, MintCapability, BurnCapability};

    const ENO_CAPABILITIES: u64 = 1;
    const EINSUFFICIENT_BALANCE: u64 = 2;

    struct Capabilities has key {
        mint_cap: MintCapability<CoinPunkcanyang>,
        burn_cap: BurnCapability<CoinPunkcanyang>,
    }

    struct CoinPunkcanyang {}

    fun init_module(sender: &signer) {
        let (burn_cap, freeze_cap, mint_cap) = coin::initialize<CoinPunkcanyang>(
            sender,
            string::utf8(b"Coin_punkcanyang"),  // name
            string::utf8(b"Punkcan"),           // symbol
            8,                                  // decimals
            true,                              // monitor_supply
        );
        
        move_to(sender, Capabilities {
            mint_cap,
            burn_cap,
        });
        
        coin::destroy_freeze_cap(freeze_cap);
    }
//https://explorer.aptoslabs.com/txn/0xa7fbe9226d960ada619ba82cd6c951991bf733045c275565dbf3ac2768f9622f/userTxnOverview?network=testnet
    public entry fun faucet(account: &signer) acquires Capabilities {
        let account_addr = signer::address_of(account);
        
        if (!coin::is_account_registered<CoinPunkcanyang>(account_addr)) {
            coin::register<CoinPunkcanyang>(account);
        };

        let capabilities = borrow_global<Capabilities>(@coin_punkcanyang);
        
        let coins = coin::mint(100000000000, &capabilities.mint_cap);
        
        coin::deposit(account_addr, coins);
    }
} 