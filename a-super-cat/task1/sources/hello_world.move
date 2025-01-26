module hello_world::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    // 0x577bb55cbbb7b09710da55acff3812663539f951298a42ebccdf4657b927197a
    // https://explorer.aptoslabs.com/txn/0x263133d0a62d95b229badd81951980c579c6054706ed620bf423075fc6be44ef?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, a-super-cat!")
        });
    }
}
