# Hello world

## 实操
```bash
git clone git@github.com:qiaopengjun5162/AptosMove-LearnToEarn.git
正克隆到 'AptosMove-LearnToEarn'...
remote: Enumerating objects: 30, done.
remote: Counting objects: 100% (30/30), done.
remote: Compressing objects: 100% (19/19), done.
remote: Total 30 (delta 8), reused 0 (delta 0), pack-reused 0 (from 0)
接收对象中: 100% (30/30), 10.88 KiB | 3.63 MiB/s, 完成.
处理 delta 中: 100% (8/8), 完成.
cd AptosMove-LearnToEarn
ls
README.md
mcd qiaopengjun5162
mcd task1
aptos move init --name task1
{
  "Result": "Success"
}
ls
Move.toml scripts   sources   tests
aptos init
Configuring for profile default
Choose network from [devnet, testnet, mainnet, local, custom | defaults to devnet]

No network given, using devnet...
Enter your private key as a hex literal (0x...) [Current: None | No input: Generate new key (or keep one if present)]

No key given, generating key...
Account 0x01f5674a8e38e21dd87268f4811a255a133449dfdd10f16420028781eae81092 doesn't exist, creating it and funding it with 100000000 Octas
Account 0x01f5674a8e38e21dd87268f4811a255a133449dfdd10f16420028781eae81092 funded successfully

---
Aptos CLI is now set up for account 0x01f5674a8e38e21dd87268f4811a255a133449dfdd10f16420028781eae81092 as profile default!
---

{
  "Result": "Success"
}
cc
aptos init
Aptos already initialized for profile default, do you want to overwrite the existing config? [yes/no] >
yes
Configuring for profile default
Choose network from [devnet, testnet, mainnet, local, custom | defaults to devnet]
testnet
Enter your private key as a hex literal (0x...) [Current: Redacted | No input: Generate new key (or keep one if present)]

No key given, keeping existing key...

---
Aptos CLI is now set up for account 0x01f5674a8e38e21dd87268f4811a255a133449dfdd10f16420028781eae81092 as profile default!
---

The account has not been created on chain yet. To create the account and get APT on testnet you must visit https://aptos.dev/network/faucet?address=0x01f5674a8e38e21dd87268f4811a255a133449dfdd10f16420028781eae81092
Press [Enter] to go there now > 
{
  "Result": "Success"
}
ls
Move.toml scripts   sources   tests
open -a RustRover .
which aptos
/opt/homebrew/bin/aptos

AptosMove-LearnToEarn/qiaopengjun5162/task1 on  main [?] via 🅒 base 
➜ aptos move compile --named-addresses hello_world=default --skip-fetch-latest-git-deps                         
Compiling, may take a little while to download git dependencies...
INCLUDING DEPENDENCY AptosFramework
INCLUDING DEPENDENCY AptosStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
{
  "Result": [
    "01f5674a8e38e21dd87268f4811a255a133449dfdd10f16420028781eae81092::hello_world"
  ]
}

AptosMove-LearnToEarn/qiaopengjun5162/task1 on  main [?] via 🅒 base took 4.8s 
➜ touch development_notes.md

AptosMove-LearnToEarn/qiaopengjun5162/task1 on  main [?] via 🅒 base 
➜ aptos move publish --named-addresses hello_world=default                              
Compiling, may take a little while to download git dependencies...
UPDATING GIT DEPENDENCY https://github.com/aptos-labs/aptos-framework.git
INCLUDING DEPENDENCY AptosFramework
INCLUDING DEPENDENCY AptosStdlib
INCLUDING DEPENDENCY MoveStdlib
BUILDING task1
package size 1069 bytes
Do you want to submit a transaction for a range of [177900 - 266800] Octas at a gas unit price of 100 Octas? [yes/no] >
yes
Transaction submitted: https://explorer.aptoslabs.com/txn/0x36bf82c5003c9471a13f6fb4c94c325989cc3e4ff9cb7643629507213ab888bd?network=testnet
{
  "Result": {
    "transaction_hash": "0x36bf82c5003c9471a13f6fb4c94c325989cc3e4ff9cb7643629507213ab888bd",
    "gas_used": 1779,
    "gas_unit_price": 100,
    "sender": "01f5674a8e38e21dd87268f4811a255a133449dfdd10f16420028781eae81092",
    "sequence_number": 0,
    "success": true,
    "timestamp_us": 1737791847000458,
    "version": 6604100925,
    "vm_status": "Executed successfully"
  }
}

```