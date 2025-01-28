module martinyeung_coin_faucet::martinyeung_faucet2 {
    use std::string;
    use std::signer;
    use aptos_framework::coin::{Self, MintCapability};

    // 0x10bad14ecc4f143c85c372d429f55ced4d93d7989fd1cb48094b80011a45cb67
    // https://explorer.aptoslabs.com/txn/0x10bad14ecc4f143c85c372d429f55ced4d93d7989fd1cb48094b80011a45cb67?network=testnet
    // Error codes
    const ENO_CAPABILITIES: u64 = 1;

    // Storing mint capability for the coin
    struct Capabilities has key {
        mint_cap: MintCapability<MY5>,
    }

    // The MY5 coin type
    struct MY5 {}

    // Initialize the MY5 coin and faucet
    public entry fun initialize(martinyeung_coin_faucet: &signer) {
        // Register the MY5 currency
        let (burn_cap, freeze_cap, mint_cap) = coin::initialize<MY5>(
            martinyeung_coin_faucet,
            string::utf8(b"Coin_MartinYeung5"),
            string::utf8(b"MY5"),
            8, // decimals
            true // monitor_supply
        );

        // Store the mint capability in the creator's account
        move_to(martinyeung_coin_faucet, Capabilities { mint_cap });

        coin::destroy_burn_cap(burn_cap);
        coin::destroy_freeze_cap(freeze_cap);
    }

    // Anyone can mint MY5 coins for themselves
    public entry fun mint(martinyeung_coin_faucet: &signer, amount: u64) acquires Capabilities {
        // Get the signer's address
        let account_addr = signer::address_of(martinyeung_coin_faucet);

        // Register the account to receive MY5 if not already registered
        if (!coin::is_account_registered<MY5>(account_addr)) {
            coin::register<MY5>(martinyeung_coin_faucet);
        };

        // Get the mint capability
        let capabilities = borrow_global<Capabilities>(@martinyeung_coin_faucet);
        
        // Mint and deposit coins to the account
        let coins = coin::mint(amount, &capabilities.mint_cap);
        coin::deposit(account_addr, coins);
    }
}