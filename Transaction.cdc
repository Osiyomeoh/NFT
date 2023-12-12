import CryptoPoops from 0x05
import NonFungibleToken from 0x06

transaction {
    // Prepare the transaction
    prepare(signer: AuthAccount) {
        // Create a new NFT
        let newNFT <- signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)
            ?.createNFT(name: "Sam Ale", favouriteFood: "Macaroni", luckyNumber: 5)
            ?? panic("Could not create the NFT")
        
        // Check if the collection exists, and if not, create and store it
        let collectionRef = signer.borrow<&CryptoPoops.Collection>(from: /storage/MyCollection)
        if collectionRef == nil {
            let emptyCollection <- CryptoPoops.createEmptyCollection()
            signer.save(<- emptyCollection, to: /storage/MyCollection)
            signer.link<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>(
                /public/NFTCollection, 
                target: /storage/MyCollection
            )
        }
        let nftIDToRetrieve = newNFT.id
        collectionRef!.deposit(token: <- newNFT)
        
        // Retrieve an NFT's metadata by ID
      
        let nftMetadata = collectionRef!.borrowAuthNFT(id: nftIDToRetrieve)
        
       log(nftMetadata.name)
        log(nftMetadata.favouriteFood)
        log(nftMetadata.luckyNumber)
        log(nftIDToRetrieve)
    }
}
