module 0x110c0e6e7192bcc4cb6b4e1dcda49d1366c44f3f0cf17e18e1cec5b93aa0ea79::hello_world {

    use std::string::{String, utf8};
    use aptos_framework::event;

    #[event]
    struct HelloWorldEvent has store, drop{
        message: String
    }
    
	// 0x110c0e6e7192bcc4cb6b4e1dcda49d1366c44f3f0cf17e18e1cec5b93aa0ea79
   // https://explorer.aptoslabs.com/txn/0x6b299bd3aa6df5481f8c23cbc76c71bd73c67f168e0a3437bb884ff577195399?network=testnet
    fun is_init_module() {
        event::emit(HelloWorldEvent{
            message: utf8(b"Hello, StarryDeserts!")
        })
    }
}