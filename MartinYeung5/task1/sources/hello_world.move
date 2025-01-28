module hello_world::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    // 0x0e1b7a678dbafa5d9c876413dccaac93c6d4790a8e6ebeb009a7f12f4defbf3b
    // https://explorer.aptoslabs.com/txn/0xe319ef36d7c25edcc956873151d396cf073be08db9f1429d833f2eb1470dad73?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, MartinYeung5!")
        });
    }
}
