
module hello_world::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    // 0x1b96cd0d759e06c0d3f3767ba6cc6a1ab140a5e65171a3c743ded7cfa3450a5c
    // https://explorer.aptoslabs.com/txn/0xe486f4b97838e55aa886c94c7d05a04f45c4e829db7c52b051ac2ef023e05c29?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, ShallWeKissForever!")
        });
    }
}