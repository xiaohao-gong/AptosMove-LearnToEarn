module hello_world::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    // 0x7fd1efdb3f312701da2ea01fb91fc5902bd2d4498c4220e9b6b13e400b5158c8
    // https://explorer.aptoslabs.com/txn/0x0785f1ff8f222f27f32f3573d02997df22c68bc3b15ab0b80cff0c82cf249d38?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, lazy-forever!")
        });
    }
}