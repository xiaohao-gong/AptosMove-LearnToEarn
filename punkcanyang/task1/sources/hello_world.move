module hello_world::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }
    //0xda59583f8253eb7185030ee7c0216b735f76906fd8c63c276f5d348b3bd49628
    //https://explorer.aptoslabs.com/txn/0x5d070154d977de61efd0f959fadda6f249e10f54254aba81b6d52c1216b0a9fe?network=testnet

    public entry fun is_init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, punkcanyang!")
        });
    }
}
