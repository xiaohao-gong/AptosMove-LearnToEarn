module AAA::coin_1 {

    use std::signer::address_of;
    use std::string::utf8;
    use aptos_framework::coin;
    use aptos_framework::coin::{MintCapability, destroy_freeze_cap, destroy_burn_cap};


    struct AAA has key,store{}
    struct Control has key,store{
        mint:MintCapability<AAA>,
    }

    fun init_module(caller:&signer){
        let (b,f,m)=coin::initialize<AAA>(caller,utf8(b"Coin_yue1823"),utf8(b"AAA"),8,false);
        move_to(caller,Control{mint:m});
        destroy_freeze_cap(f);
        destroy_burn_cap(b);
    }

    public entry fun faucet(caller:&signer) acquires Control {
        if(!coin::is_account_registered<AAA>(address_of(caller))){
            coin::register<AAA>(caller);
        };
        let borrow= borrow_global<Control>(@AAA);
        coin::deposit(address_of(caller),coin::mint(10000000000000,&borrow.mint));
    }
}
