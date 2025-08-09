# Simple Voting Contract

## Project Description

A decentralized voting system built on the Aptos blockchain that enables transparent and secure proposal creation and voting mechanisms. The contract utilizes token-weighted voting, where the voting power is determined by the amount of tokens a participant stakes during the voting process. This ensures that participants with higher token stakes have proportionally greater influence in the decision-making process.

## Project Vision

Our vision is to create a fair and transparent democratic system on the blockchain where:

- **Transparency**: All votes and proposals are recorded immutably on the blockchain
- **Token-Weighted Democracy**: Voting power is proportional to token stake, encouraging meaningful participation
- **Decentralized Governance**: No central authority controls the voting process
- **Secure Voting**: Cryptographic security ensures vote integrity and prevents double voting
- **Accessible Participation**: Anyone with tokens can create proposals and participate in voting

## Key Features

### 🗳️ **Proposal Creation**
- Simple one-function proposal creation mechanism
- Any token holder can create a voting proposal
- Proposals are automatically set to active status upon creation

### ⚖️ **Token-Weighted Voting**
- Voting power is determined by the number of tokens staked
- Supports both "Yes" and "No" voting options
- Tokens are transferred during voting as a commitment mechanism

### 🔒 **Vote Security**
- Double voting prevention through VoteRecord tracking
- Immutable vote recording on the blockchain
- Active proposal status checking before vote acceptance

### 📊 **Real-time Vote Tracking**
- Automatic tallying of yes and no votes
- Token weight calculation for each vote
- Transparent vote counting mechanism

## Future Scope

### Phase 2 Enhancements
- **Proposal Deadline Management**: Add time-based proposal expiration
- **Vote Withdrawal**: Allow voters to withdraw votes before proposal ends
- **Minimum Threshold**: Implement minimum participation requirements
- **Proposal Categories**: Support different types of proposals

### Phase 3 Advanced Features
- **Delegated Voting**: Allow token holders to delegate voting power
- **Quadratic Voting**: Implement quadratic voting mechanisms
- **Multi-choice Proposals**: Support proposals with multiple options
- **Governance Token Integration**: Create dedicated governance tokens

### Phase 4 Platform Integration
- **Web Interface**: Develop user-friendly web application
- **Mobile Application**: Create mobile app for voting participation
- **Analytics Dashboard**: Provide voting statistics and insights
- **API Integration**: Enable third-party platform integration

## Contract Details

*[Contract details section - to be filled by the developer]*

---

## Getting Started

### Prerequisites
- Aptos CLI installed
- Move compiler setup
- Sufficient AptosCoin balance for voting

### Deployment
```bash
aptos move compile
aptos move publish
```

### Usage
1. Create a proposal using `create_proposal()` function
2. Participate in voting using `vote()` function with desired token amount
3. Monitor vote results through blockchain queries

## Contributing

We welcome contributions to enhance the voting system. Please submit pull requests with detailed descriptions of proposed changes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.