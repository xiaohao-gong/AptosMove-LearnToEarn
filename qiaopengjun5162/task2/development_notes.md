# Aptos Move

## 实操
```bash
mcd task2
aptos move init --name aptos_token
{
  "Result": "Success"
}
ls
Move.toml scripts   sources   tests
open -a RustRover .

AptosMove-LearnToEarn/qiaopengjun5162/task2 on  main [?] via 🅒 base 
➜ aptos init                        
Configuring for profile default
Choose network from [devnet, testnet, mainnet, local, custom | defaults to devnet]
testnet
Enter your private key as a hex literal (0x...) [Current: None | No input: Generate new key (or keep one if present)]

No key given, generating key...

---
Aptos CLI is now set up for account 0x0641e380eb6e0943db2aa758f2bae67717d2787091bc27964583ce66a9407297 as profile default!
---

The account has not been created on chain yet. To create the account and get APT on testnet you must visit https://aptos.dev/network/faucet?address=0x0641e380eb6e0943db2aa758f2bae67717d2787091bc27964583ce66a9407297
Press [Enter] to go there now > 
{
  "Result": "Success"
}

AptosMove-LearnToEarn/qiaopengjun5162/task2 on  main [?] via 🅒 base took 38.4s 
➜ touch development_notes.md

AptosMove-LearnToEarn/qiaopengjun5162/task2 on  main [?] via 🅒 base 
➜ aptos account fund-with-faucet --account default
{
  "Error": "Invalid arguments: To get testnet APT you must visit https://aptos.dev/network/faucet. If you are confident you want to use a faucet programmatically, set --faucet-url or add a faucet URL to .aptos/config.yaml for the current profile"
}

AptosMove-LearnToEarn/qiaopengjun5162/task2 on  main [?] via 🅒 base took 4.9s 
➜ aptos move build --skip-fetch-latest-git-deps 
Compiling, may take a little while to download git dependencies...
INCLUDING DEPENDENCY AptosFramework
INCLUDING DEPENDENCY AptosStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING aptos_token
{
  "Result": [
    "0641e380eb6e0943db2aa758f2bae67717d2787091bc27964583ce66a9407297::aptos_token"
  ]
}

AptosMove-LearnToEarn/qiaopengjun5162/task2 on  main [?] via 🅒 base 
➜ aptos move publish --named-addresses aptos_coin=default                                                       
Compiling, may take a little while to download git dependencies...
UPDATING GIT DEPENDENCY https://github.com/aptos-labs/aptos-framework.git
INCLUDING DEPENDENCY AptosFramework
INCLUDING DEPENDENCY AptosStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING aptos_token
package size 2490 bytes
{
  "Error": "Simulation failed with status: Move abort in 0x1::coin: ECOIN_SYMBOL_TOO_LONG(0x1000d): Symbol of the coin is too long"
}

AptosMove-LearnToEarn/qiaopengjun5162/task2 on  main [?] via 🅒 base took 24.3s 
➜ aptos move build --skip-fetch-latest-git-deps                                                                 
Compiling, may take a little while to download git dependencies...
INCLUDING DEPENDENCY AptosFramework
INCLUDING DEPENDENCY AptosStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING aptos_token
{
  "Result": [
    "0641e380eb6e0943db2aa758f2bae67717d2787091bc27964583ce66a9407297::aptos_token"
  ]
}

AptosMove-LearnToEarn/qiaopengjun5162/task2 on  main [?] via 🅒 base took 4.5s 
➜ aptos move publish --named-addresses aptos_coin=default
Compiling, may take a little while to download git dependencies...
UPDATING GIT DEPENDENCY https://github.com/aptos-labs/aptos-framework.git
INCLUDING DEPENDENCY AptosFramework
INCLUDING DEPENDENCY AptosStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING aptos_token
package size 2477 bytes
Do you want to submit a transaction for a range of [285000 - 427500] Octas at a gas unit price of 100 Octas? [yes/no] >
yes
Transaction submitted: https://explorer.aptoslabs.com/txn/0x33466674d138a3a41f2d577d3e082dcfee0cb7d2057e26d999c39eb218824f72?network=testnet
{
  "Result": {
    "transaction_hash": "0x33466674d138a3a41f2d577d3e082dcfee0cb7d2057e26d999c39eb218824f72",
    "gas_used": 2850,
    "gas_unit_price": 100,
    "sender": "0641e380eb6e0943db2aa758f2bae67717d2787091bc27964583ce66a9407297",
    "sequence_number": 0,
    "success": true,
    "timestamp_us": 1738314140761383,
    "version": 6609973868,
    "vm_status": "Executed successfully"
  }
}


```

## 参考
- https://aptos.dev/en/build/smart-contracts/aptos-coin
- https://aptos.dev/en/build/smart-contracts/book/modules-and-scripts
- https://github.com/Enchanter-Finance/ent-coin/blob/master/sources/ent.move