module coin_faucet2::coin_faucet{
    use std::signer::address_of;
    use std::string::utf8;
    use aptos_framework::coin;
    use aptos_framework::coin::{MintCapability, BurnCapability, FreezeCapability};

    struct Coin {}

    struct CoinCaps has key {
        MintCap: MintCapability<Coin>,
        BurnCap: BurnCapability<Coin>,
        FreezeCap: FreezeCapability<Coin>,
    }

    // 0x1b96cd0d759e06c0d3f3767ba6cc6a1ab140a5e65171a3c743ded7cfa3450a5c
    // https://explorer.aptoslabs.com/txn/0x88d20df4815c73d1f7f7d10a3fd375badff66b2a2d5140eae9846100a20ffd17?network=testnet
    fun init_module(sender: &signer) {
        let (b, f, m) = coin::initialize<Coin>(
            sender,
            utf8(b"Coin_ShallWeKikkForever"),
            utf8(b"SWKF"),
            8,
            false
        );

        move_to(sender, CoinCaps{
            MintCap: m,
            BurnCap: b,
            FreezeCap: f,
        });
    }

    entry fun mint(sender: &signer, amount: u64) acquires CoinCaps {
        let sender_account = address_of(sender);
        if(!coin::is_account_registered<Coin>(sender_account)){
          coin::register<Coin>(sender);
        };
        let new_coins = coin::mint(
            amount,
            &borrow_global<CoinCaps>(@coin_faucet2).MintCap,
        );
        coin::deposit(
            sender_account,
            new_coins,
        )
    }
}