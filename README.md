# Decentralized Hospitality Sustainable Tourism Certification

This project implements a decentralized system for sustainable tourism certification using Clarity smart contracts on the Stacks blockchain. The system enables tourism operators to be verified, assessed for sustainability practices, certified, and monitored for their environmental impact and community benefits.

## Smart Contracts

The system consists of five main smart contracts:

1. **Tourism Operator Verification Contract**
    - Validates and verifies tourism operators
    - Stores operator information and verification status
    - Allows admin to verify operators

2. **Sustainability Assessment Contract**
    - Manages sustainability assessments for tourism operators
    - Evaluates operators across environmental, social, economic, and cultural dimensions
    - Calculates total sustainability scores

3. **Certification Management Contract**
    - Issues sustainability certifications based on assessment scores
    - Manages different certification levels (Bronze, Silver, Gold, Platinum)
    - Handles certification validity and expiration

4. **Impact Monitoring Contract**
    - Monitors tourism environmental impact
    - Tracks metrics like carbon emissions, water usage, waste management, and biodiversity
    - Allows operators to set and track impact reduction goals

5. **Community Benefit Contract**
    - Ensures tourism benefits local communities
    - Tracks metrics like local employment, local sourcing, community projects, and cultural preservation
    - Allows operators to set and track community benefit targets

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) - Clarity development environment
- [Node.js](https://nodejs.org/) - For running tests

### Installation

1. Clone the repository
2. Install dependencies:
   \`\`\`
   npm install
   \`\`\`

### Testing

Run the tests using Vitest:
\`\`\`
npm test
\`\`\`

## Usage

The contracts can be deployed to the Stacks blockchain and interacted with through:

1. Direct contract calls using the Stacks API
2. Integration with a frontend application
3. Integration with existing tourism platforms

## Key Features

- **Decentralized Verification**: Tourism operators are verified on-chain
- **Transparent Assessment**: Sustainability assessments are stored immutably
- **Tiered Certification**: Multiple certification levels based on sustainability scores
- **Impact Tracking**: Environmental impact metrics are monitored over time
- **Community Benefits**: Ensures tourism benefits local communities

## License

This project is licensed under the MIT License - see the LICENSE file for details.

