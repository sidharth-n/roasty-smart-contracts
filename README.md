# 🤖 Agent Roasty Smart Contracts

<div align="center">

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Solidity](https://img.shields.io/badge/Solidity-%5E0.8.0-363636.svg)](https://soliditylang.org/)
[![Hardhat](https://img.shields.io/badge/Built%20with-Hardhat-FFDB1C.svg)](https://hardhat.org/)
[![Network](https://img.shields.io/badge/Network-Sepolia-blue.svg)](https://sepolia.etherscan.io/)

_A decentralized subscription and treasury management system for the Agent Roasty Discord bot, built on Ethereum (Sepolia testnet)_ 🚀

[Features](#key-features) •
[Installation](#getting-started) •
[Contracts](#smart-contracts) •
[Documentation](#documentation) •
[Contributing](#contributing)

</div>

## 📋 Overview

This project contains two main smart contracts that power Agent Roasty's subscription and community treasury features:

1. **Subscription Contract** 💳
   - Handles monthly user subscriptions (0.005 ETH) for bot access
2. **Safe Factory** 🏭
   - Creates 2/2 multisig Safe accounts for secure community treasury management

## 🌟 Key Features

- 💰 Monthly subscription system (0.005 ETH)
- 🔐 2/2 Multisig Safe creation (user + bot as signers)
- 📊 Automated treasury management
- 🎯 Event emission for bot integration
- ⚡ Gas-optimized operations
- 🛡️ Security-first design

## 📍 Contract Addresses (Sepolia)

| Contract               | Address                                      |
| ---------------------- | -------------------------------------------- |
| 📝 Subscription        | `0x9Fe9155f1fecBEca4a789967C3a45ff2Cb5a2617` |
| 🏭 SafeFactory         | `0xB1386a71C2dC83dA35b5764aF29E6326F1079da2` |
| 🤖 Agent Roasty's Safe | `0xe05DCAf9206D125D7887919784756af8e69FaD89` |

## 🚀 Getting Started

### Prerequisites

| Requirement     | Version          |
| --------------- | ---------------- |
| Node.js         | v16+             |
| npm             | Latest           |
| Ethereum Wallet | With Sepolia ETH |
| API Key         | Alchemy/Infura   |

### 🛠️ Installation

1. Clone the repository:

```bash
git clone https://github.com/sidharth-n/agent-roasty-contracts.git
cd agent-roasty-contracts
```

2. Install dependencies:

```bash
npm install
```

3. Create a `.env` file:

```env
RPC_URL=your_sepolia_rpc_url
PRIVATE_KEY=your_private_key
```

## 📄 Smart Contracts

### Subscription.sol

- 💳 Handles user subscriptions
- 💰 Cost: 0.005 Sepolia ETH per month
- 📡 Emits `Subscribed` events for bot integration
- 🏦 Automatically forwards funds to treasury

### SafeFactory.sol

- 🏭 Creates 2/2 multisig Safe accounts
- 🤖 Configures Agent Roasty as a permanent signer
- 🏦 Enables secure community treasury management
- 📡 Emits `SafeDeployed` events

## 🧪 Testing

Run the test suite:

```bash
npx hardhat test
```

For gas reporting:

```bash
REPORT_GAS=true npx hardhat test
```

## 🚀 Deployment

Deploy to Sepolia testnet:

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

## 🔒 Security Considerations

### 1. Multisig Security

- 🔐 All Safe accounts require 2/2 signatures
- 🤖 Agent Roasty's signer address is hardcoded
- ✅ Admin address validation on deployment

### 2. Fund Management

- 💸 Subscription payments auto-forward to treasury
- 🏦 No fund storage in subscription contract
- ⏰ Safe timelock mechanisms

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. 🍴 Fork the repository
2. 🌿 Create your feature branch (`git checkout -b feature/amazing-feature`)
3. 💾 Commit your changes (`git commit -m 'Add some amazing feature'`)
4. 📤 Push to the branch (`git push origin feature/amazing-feature`)
5. 🎯 Open a Pull Request

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact & Support

- 📧 Project Link: [https://github.com/sidharth-n/agent-roasty-contracts](https://github.com/sidharth-n/agent-roasty-contracts)
- 🐛 Report bugs: [Issue Tracker](https://github.com/sidharth-n/agent-roasty-contracts/issues)
- 💡 Feature requests: [New Feature](https://github.com/sidharth-n/agent-roasty-contracts/issues/new)

---

<div align="center">

Made with ❤️ by the Agent Roasty team

</div>
