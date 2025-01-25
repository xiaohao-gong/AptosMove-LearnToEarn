module 0xbc45084bfed3c436ba72c1121034e4b44dde9cee1e2776a7f719ef032d7102bd::helloworld {

    use std::string::{String, utf8};
    use aptos_framework::event;

    #[event]
    struct HelloWorldEvent has store,drop{
        message: String
    }

    // 0x296e53ce1956ebdef5d969f3189a00b0ca29f2d377b311e30872202d4072b19b
    // https://explorer.aptoslabs.com/txn/6604052382?network=testnet
    public entry fun is_init_module(){
        event::emit(HelloWorldEvent{
            message: utf8(b"Hello, yue1823!")
        })
    }

}
