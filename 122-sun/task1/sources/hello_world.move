module 0x03e6234c41aefb7f24bb094137924787046edc60aaf2a2b0e9b75fe9d5271e19::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    // 0x7ac41d6dae34e199eb742ff88b53cce0f610097477e47388b06b8fea99237ccd
    // https://explorer.aptoslabs.com/txn/0x91f9126b38cb78d9decde58f8545e64453c304c0c1bbe2fd8b5b3c0fb1887437?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, 122-sun!")
        });
    }
}