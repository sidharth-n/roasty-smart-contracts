# Agent Roasty Smart Contracts

A decentralized subscription and treasury management system for the Agent Roasty Discord bot, built on Ethereum (Sepolia testnet).

## Overview

This project contains two main smart contracts that power Agent Roasty's subscription and community treasury features:

1. **Subscription Contract**: Handles monthly user subscriptions (0.005 ETH) for bot access
2. **Safe Factory**: Creates 2/2 multisig Safe accounts for secure community treasury management

## Key Features

- 📝 Monthly subscription system (0.005 ETH)
- 🔐 2/2 Multisig Safe creation (user + bot as signers)
- 💰 Automated treasury management
- 🎯 Event emission for bot integration

## Contract Addresses (Sepolia)

- Subscription: `0x9Fe9155f1fecBEca4a789967C3a45ff2Cb5a2617`
- SafeFactory: `0xB1386a71C2dC83dA35b5764aF29E6326F1079da2`
- Agent Roasty's Safe Account: `0xe05DCAf9206D125D7887919784756af8e69FaD89`

## Getting Started

### Prerequisites

- Node.js v16+ and npm
- An Ethereum wallet with Sepolia ETH
- Alchemy or Infura API key

### Installation

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

```
RPC_URL=your_sepolia_rpc_url
PRIVATE_KEY=your_private_key
```

## Smart Contracts

### Subscription.sol

- Handles user subscriptions
- Cost: 0.005 Sepolia ETH per month
- Emits `Subscribed` events for bot integration
- Automatically forwards funds to treasury

### SafeFactory.sol

- Creates 2/2 multisig Safe accounts
- Configures Agent Roasty as a permanent signer
- Enables secure community treasury management
- Emits `SafeDeployed` events

## Testing

Run the test suite:

```bash
npx hardhat test
```

For gas reporting:

```bash
REPORT_GAS=true npx hardhat test
```

## Deployment

Deploy to Sepolia testnet:

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

## Security Considerations

1. **Multisig Security**

   - All Safe accounts require 2/2 signatures
   - Agent Roasty's signer address is hardcoded
   - Admin address validation on deployment

2. **Fund Management**
   - Subscription payments auto-forward to treasury
   - No fund storage in subscription contract
   - Safe timelock mechanisms

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

Project Link: [https://github.com/sidharth-n/agent-roasty-contracts](https://github.com/sidharth-n/agent-roasty-contracts)
