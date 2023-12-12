# CryptoPoops NFT Contract

## Overview

The CryptoPoops NFT Contract is a Flow blockchain implementation, providing a robust and feature-rich standard for creating, managing, and interacting with non-fungible tokens (NFTs). This contract is built using Cadence, a resource-oriented programming language optimized for smart contracts.

## Features

- **NFT Standard Compliance**: Adheres to the NonFungibleToken contract interface, ensuring compatibility with Flow's NFT standards.
- **Unique NFT Properties**: Each NFT comes with unique attributes like `name`, `favouriteFood`, and `luckyNumber`.
- **Resource Management**: Utilizes Cadence's resource-oriented model for secure and efficient NFT handling.
- **Collection Management**: Users can create collections, deposit and withdraw NFTs, and access NFT metadata.

## Contract Interfaces and Resources

- `NonFungibleToken`: The main NFT contract interface defining the standard NFT structure and events.
- `NFT`: A resource representing an individual non-fungible token with unique attributes.
- `Collection`: A resource for managing groups of NFTs owned by a user, including functionalities to deposit, withdraw, and borrow NFTs.
- `Minter`: A resource that allows the creation of new NFTs.

## Getting Started

### Prerequisites

Ensure you have the Flow CLI installed and configured for interaction with the Flow blockchain.

### Importing the Contract

```cadence
import CryptoPoops from 0x05
import NonFungibleToken from 0x06
```

Replace `0x05` and `0x06` with the appropriate account addresses where the contracts are deployed.

### Contract Initialization

The contract is initialized upon deployment, setting up the necessary resources in the account's storage.

### Creating NFTs

Use the `Minter` resource to create new NFTs. Example transaction:

```cadence
transaction {
    prepare(signer: AuthAccount) {
        let newNFT <- signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)
            ?.createNFT(name: "ExampleName", favouriteFood: "Pizza", luckyNumber: 7)
            ?? panic("Could not create the NFT")
        
        // Add additional logic as required
    }
}
```

### Managing Collections

Users can manage their NFT collections, including depositing and withdrawing NFTs.

### Example Scripts and Transactions

Refer to the provided Cadence scripts and transactions for detailed examples of interacting with the contract.

## Contributing

Contributions to the CryptoPoops NFT contract are welcome. Please ensure that all contributions adhere to the Flow blockchain standards and best practices.

