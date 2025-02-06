module 0x4d16b6adc4dcef3e05ba16d3376fcb4af444da1a59549c131713da3a1b18ee9c::hello_world {
    use std::string::{String, utf8};
    struct HelloWorld has key {
        message: String
    }
    // 0x4d16b6adc4dcef3e05ba16d3376fcb4af444da1a59549c131713da3a1b18ee9c
    // https://explorer.aptoslabs.com/txn/0xe45f652c92e666dc6c911384b0baae9ed120875756b7f0be75494814558fcece?network=testnet
    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, xiaohao-gong!")
        });
    }
}
