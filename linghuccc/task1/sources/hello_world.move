module hello_world::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    // 0x83f4f8e6909a80c5ae9ede31d3367484d94630b69dd8bfdc20fb193a827fde0f
    // https://explorer.aptoslabs.com/txn/0x0194c2fcade07d1c4e1a4fb70187dce6c3001706ed51de31de4a92fd2abaf9b6?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, linghuccc!")
        });
    }
}
