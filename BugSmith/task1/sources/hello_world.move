module 0xe9b69b57cc7b1d2a9601f873c48b1297d863867db42d846fa6f9d6f754d966c7::hello_world {
    use std::string::{String, utf8};


    struct HelloWorld has key {
        message: String
    }

    fun init_module(sender: &signer) {
        move_to(sender, HelloWorld{
            message:  utf8(b"Hello, BugSmith!")
        });
    }
}
