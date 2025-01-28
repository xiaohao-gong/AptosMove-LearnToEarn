module user::past_faucet {
    use std::signer;
    use std::string;
    use aptos_framework::coin::{Self, MintCapability, initialize};

    struct FaucetCapability has key {
        mint_cap: MintCapability<FaucetCoin>,
    }


    struct FaucetCoin has drop {}

    // 0x110c0e6e7192bcc4cb6b4e1dcda49d1366c44f3f0cf17e18e1cec5b93aa0ea79
    // https://explorer.aptoslabs.com/txn/0xa4abccb05f4c62dea2754633ae5cccf41bfadd97c1c196ccdbbefdf9b52a2eda?network=testnet
    fun init_module(admin: &signer) {

        let (burn_cap,freeze_cap,  mint_cap) = initialize<FaucetCoin>(
            admin,
            string::utf8(b"Coin_StarryDeserts"),
            string::utf8(b"PSDF"),
            8,
            true,
        );

        coin::destroy_freeze_cap(freeze_cap);
        coin::destroy_burn_cap(burn_cap);

        move_to(
            admin,
            FaucetCapability {
                mint_cap
            }
        );
    }

    public entry fun mint(user: &signer, amount: u64) acquires FaucetCapability {
        coin::register<FaucetCoin>(user);

        let addr = signer::address_of(user);
        let faucet = borrow_global<FaucetCapability>(@user);
        let coins = coin::mint<FaucetCoin>(amount, &faucet.mint_cap);
        coin::deposit(addr, coins);
    }
}
