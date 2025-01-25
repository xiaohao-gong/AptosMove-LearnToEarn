# AptosMove LearnToEarn
![Web 1920 1 (4)](https://github.com/user-attachments/assets/1f52b068-61fb-456d-98ca-cda7042ade30)

>Aptos Move Learn To Earn 是由 Faintlight x KeyMap 联合发起的 Aptos Move 共学营。

>帮助大家学习 Aptos Move 合约以及更高级的合约操作以及 typescript sdk 、React 中的 wallet 组件的用法等。

>希望大家可以用更轻松的心态学习一门新的语言，接触新的公链技术



## 任务列表

| 任务编号 | 任务名称 | 任务奖励 |
|--------|--------|--------|
| [Task 1](https://www.buildthree.xyz/bounty/0xd4548fe6626f7fb1c188d233677145ee1018aa2506590535baeeb602c01fabb1) | 完成 Aptos Testnet 上的 hello  world 合约部署 | 1 USDT |


### Task 1

任务简要： 完成 Aptos Testnet 上的 hello  world 合约部署
任务奖励： 1 USDT 
任务详情：

- 完成 hello world 合约，并将 Message 改为 `hello \<Your github id>`
- 将合约部署 txn 写入合约的注释部分
- 将合约源码用 pull request 的方式提交至当前仓库（合约应该放入 一个以你的 Github id 作为名字的文件夹）
- 等待 PR 审核，完成修改
- 将已经合并的 PR 链接发送至 Build3 的 Proof 等待审核并领取奖励

#### Task 1 操作步骤（Task 1 为示例教学关，后续不会由操作步骤演示）：
<details>
1. **Fork 本项目**
   点击右上角的 `Fork` 按钮，将项目 fork 到你的 GitHub 账户。

2. **Clone 本地仓库**
   在本地将 fork 后的仓库 clone 到你的本地：

   **注意修改 <your-username> 部分为你的 Github id，否则 clone 失败**
  
   ```bash
   git clone https://github.com/<your-username>/AptosMove-LearnToEarn.git
   cd AptosMove-LearnToEarn
   ```
3. **创建文件夹结构**
  在根目录下创建一个以你的 GitHub ID 命名的文件夹，然后在该文件夹下创建 task1 文件夹，并将 Hello World 合约放入该文件夹中
  
  例如，假设你的 GitHub ID 为 username，文件夹结构应如下所示：

  ```
  username/
  └── task1/
      └── sources
          └── hello_world.move
      └── Move.toml
  ```

  1. 可以使用 `mkdir username` 创建外层文件夹

  2. 然后使用 `mkdir task1` 创建 task 1 文件夹
  
  3. 执行 `cd task1` 进入 task 1 文件夹 

  4. 并执行 `aptos move init --name task1` 创建 Aptos 项目目录结构

  5. 在 sources 目录下创建 hello_world.move 文件
4. **编写 hello_world.move**
   在 hello_world.move 中填写以下代码，注意要将 <Your Github ID> Github ID 修改成自己的

   ```
   module hello_world::hello_world {
       use std::string::{String, utf8};
   
   
       struct HelloWorld has key {
           message: String
       }
   
       fun init_module(sender: &signer) {
           move_to(sender, HelloWorld{
               message:  utf8(b"Hello, <Your Github ID>!")
           });
       }
   }

   ```
5. **编译并publish 合约**
   - 可以先使用 `aptos init` 创建一个私钥账户，并根据提示领取测试币
   - 使用 `aptos move publish` 可以部署代码
   - 将在部署代码前替换下方的 <在 Build3 领取任务的钱包地址> 
   - 将部署代码后的 txn hash 保存到当前代码中 , 替换 <TXN Hash>

   ```

   module hello_world::hello_world {
       use std::string::{String, utf8};
   
   
       struct HelloWorld has key {
           message: String
       }

       // <在 Build3 领取任务的钱包地址>
       // https://explorer.aptoslabs.com/txn/<TXN Hash>?network=testnet
       fun init_module(sender: &signer) {
           move_to(sender, HelloWorld{
               message:  utf8(b"Hello, <Your Github ID>!")
           });
       }
   }
   ```
6. **commit 代码并提交 Pull request**
   - 这一步骤可以使用 AI 或者 搜索引擎
7. **等待合并 - 提交 PR 的链接至 Build3**
   - 当请求合并的 PR 被成功合并后，将合并的 PR 链接发送至
</details>
