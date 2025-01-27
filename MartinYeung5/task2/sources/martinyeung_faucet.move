module martinyeung_faucet::martinyeung_faucet {
    use aptos_framework::fungible_asset::{
        Self,
        TransferRef,
        MintRef
    };
    use aptos_framework::object::{Self, Object};
    use aptos_framework::primary_fungible_store;
    use std::string::utf8;
    use std::option;
    use std::signer;

   const ASSET_SYMBOL: vector<u8> = b"CMY5";

    struct MyMintRef has key {
        mint_ref: MintRef
    }

    struct MyTransferRef has key {
        transfer_ref: TransferRef
    }

    // 0x7bfaef744b64fd97a22369d296b28462e33c5de409d702818449cced5f79d464
    // https://explorer.aptoslabs.com/txn/0x7bfaef744b64fd97a22369d296b28462e33c5de409d702818449cced5f79d464?network=testnet
    fun init_module(martinyeung_faucet: &signer) {
        let constructor_ref = object::create_named_object(martinyeung_faucet, ASSET_SYMBOL);
        primary_fungible_store::create_primary_store_enabled_fungible_asset(
            &constructor_ref,
            option::none(),
            utf8(b"Coin_MartinYeung5"),
            utf8(ASSET_SYMBOL), 
            8,
            utf8(b"http://example.com/favicon.ico"),
            utf8(b"http://example.com") 
        );

        let mint_ref = fungible_asset::generate_mint_ref(&constructor_ref);
        let transfer_ref = fungible_asset::generate_transfer_ref(&constructor_ref);

        move_to(
            martinyeung_faucet,
            MyMintRef { mint_ref }
        );

        move_to(
            martinyeung_faucet,
            MyTransferRef { transfer_ref }
        );
    }

    entry fun faucet(sender: &signer, amount: u64) acquires MyMintRef {
        let my_mint_ref = borrow_global<MyMintRef>(@martinyeung_faucetyes);
        let fa = fungible_asset::mint(&my_mint_ref.mint_ref, amount);
        primary_fungible_store::deposit(signer::address_of(sender), fa);
    }

}

