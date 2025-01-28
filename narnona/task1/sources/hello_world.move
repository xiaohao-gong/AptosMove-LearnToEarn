module hello_world::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    // 0x69e40088ac770abdacde94cbf309347f5c9b7aabe7a50697105290d49a99a017
    // https://explorer.aptoslabs.com/txn/0xb5228ee356bbf57b84ff39fc1bb0930a3fa00f8b3739782146b4f1351ba3cbaf/events?network=devnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, narnona!")
        });
    }
}
