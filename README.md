# Smart Contract Error Handling Implementation
This Solidity smart contract provides an example implementation of error handling within a decentralized application (DApp) context. It utilizes the Ethereum blockchain and follows the ERC-20 standard.

## Features
- Error Handling: Demonstrates how to handle errors within a Solidity smart contract.
- Owner Control: Only the contract owner can set a new owner address, ensuring security and control over contract management.
- Budget Management: Tracks a total budget and ensures that operations within the contract do not exceed it.
## Description
- This smart contract is designed to showcase error handling techniques in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract includes the following key components:
- Error Declaration: Defines a custom error InsufficientBalance which is used to handle cases where the total budget is insufficient to perform an operation.
- Budget Management: The contract maintains a total_budget variable representing the total available budget. The matchBudget function verifies whether the total of three provided values exceeds the budget. If it does, the contract reverts execution and raises the InsufficientBalance error.
- Commutative Law Check: The CommutativeLawCheck internal function ensures that addition and multiplication operations follow the commutative law, enhancing the integrity of the contract's calculations.
- Owner Control: The contract includes a setNewOwner function allowing the current owner to set a new owner address. This feature ensures that only authorized individuals can modify ownership, enhancing security.

## Usage
To utilize this contract, deploy it to an Ethereum-compatible blockchain network such as Ethereum mainnet or a testnet. Once deployed, interact with the contract using Ethereum-compatible wallets or through decentralized applications.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., error_implementation.sol). Copy and paste the following code into the file:

```solidity
//SPDX-License-Identifer:MIT
pragma solidity ^0.8.9;

contract error_implementation {
    address owner;
    uint public total_budget=500;

    constructor(address initOwner) {
        owner = initOwner;     
    }

error InsufficientBalance(uint final_total, uint available);

    function matchBudget(uint a, uint b, uint c) public view {
        CommutativeLawCheck(a, b, c);
        uint total = a + b + c;
        if (total > total_budget) {
            revert InsufficientBalance({
                final_total: total,
                available: total_budget
            });
        }
    }

    function CommutativeLawCheck(uint a,uint b, uint c) internal pure {
        assert(a+b+c==c+b+a && a*b*c==c*b*a);
    }

    function setNewOwner(address newOwner) public {
        require(msg.sender == owner, "Only owner can set a new owner");
        require(newOwner != address(0) && newOwner!=owner, "Invalid address");
        owner = newOwner;
    }
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile error_implementation.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "error_implementation" contract from the dropdown menu, and then click on the "Deploy" button.

## Authors

Manvitha R kabbathi
[manvitha.r.kabbathi@gmail.com]


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
