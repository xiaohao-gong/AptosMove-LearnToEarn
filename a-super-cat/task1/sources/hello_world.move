module hello_world::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    // 0x577bb55cbbb7b09710da55acff3812663539f951298a42ebccdf4657b927197a
    // https://explorer.aptoslabs.com/txn/0x6238c6e8f786a4ce3c5979d3dafabd859821875291ac3c03c2deb308dc9b4f4c?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, a-super-cat!")
        });
    }
}
