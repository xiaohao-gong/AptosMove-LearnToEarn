module aptos_coin::aptos_token {
    use std::signer;
    use std::string;

    use aptos_framework::coin::{Self, BurnCapability, MintCapability};

    /// coin DECIMALS
    const DECIMALS: u8 = 8;

    /// Error codes
    const ERR_NO_CAPABILITIES: u64 = 0;
    const ERR_HAS_CAPABILITIES: u64 = 1;

    struct APTOS_TOKEN has key, store {}

    struct CoinCapabilities<phantom APTOS_TOKEN> has key, store {
        mint_capability: MintCapability<APTOS_TOKEN>,
        burn_capability: BurnCapability<APTOS_TOKEN>,
    }

    // 0xfa38c167da8daece0141bac61dc3ca9f7e54a4148f000c7643b146c1318ffb73
    // https://explorer.aptoslabs.com/txn/0x33466674d138a3a41f2d577d3e082dcfee0cb7d2057e26d999c39eb218824f72?network=testnet
    fun init_module(account: &signer) {
        let (burn_capability, freeze_capability, mint_capability) = coin::initialize<APTOS_TOKEN>(
            account,
            string::utf8(b"Coin_qiaopengjun5162"),
            string::utf8(b"QiaoC"),
            DECIMALS,
            true,
        );

        assert!(
            !exists<CoinCapabilities<APTOS_TOKEN>>(@aptos_coin),
            ERR_HAS_CAPABILITIES
        );

        move_to<CoinCapabilities<APTOS_TOKEN>>(account, CoinCapabilities<APTOS_TOKEN> {
            mint_capability,
            burn_capability,
        });

        coin::destroy_freeze_cap(freeze_capability);
    }

    public entry fun mint<APTOS_TOKEN>(account: &signer, user: address, amount: u64) acquires CoinCapabilities {
        let account_address = signer::address_of(account);
        if (!coin::is_account_registered<APTOS_TOKEN>(account_address)) {
            coin::register<APTOS_TOKEN>(account);
        };

        assert!(exists<CoinCapabilities<APTOS_TOKEN>>(account_address), ERR_NO_CAPABILITIES);
        let mint_capability = &borrow_global<CoinCapabilities<APTOS_TOKEN>>(account_address).mint_capability;
        let coins = coin::mint<APTOS_TOKEN>(amount, mint_capability);
        coin::deposit(user, coins)
    }

    // Structs cannot be used as entry function parameters; only basic types are accepted.
    public fun burn<APTOS_TOKEN>(token: coin::Coin<APTOS_TOKEN>) acquires CoinCapabilities {
        let burn_capability = &borrow_global<CoinCapabilities<APTOS_TOKEN>>(@aptos_coin).burn_capability;
        coin::burn<APTOS_TOKEN>(token, burn_capability);
    }

    public entry fun burn_coin<APTOS_TOKEN>(account: &signer, user: &signer, amount: u64) acquires CoinCapabilities {
        let account_address = signer::address_of(account);

        if (!coin::is_account_registered<APTOS_TOKEN>(account_address)) {
            coin::register<APTOS_TOKEN>(account);
        };

        assert!(exists<CoinCapabilities<APTOS_TOKEN>>(account_address), ERR_NO_CAPABILITIES);

        let burn_capability = &borrow_global<CoinCapabilities<APTOS_TOKEN>>(account_address).burn_capability;

        let coins = coin::withdraw<APTOS_TOKEN>(user, amount);

        coin::burn<APTOS_TOKEN>(coins, burn_capability);
    }
}