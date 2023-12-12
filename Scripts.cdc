import CryptoPoops from 0x05
import NonFungibleToken from 0x06

// Script to borrow an authorized reference to a CryptoPoops NFT
pub fun main(accountAddress: Address, nftID: UInt64): &NonFungibleToken.NFT {
    // Fetch the public capability for the NFT collection from the specified account
    let collectionRef = getAccount(accountAddress)
        .getCapability<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>(/public/NFTCollection)
        .borrow()
        ?? panic("Could not borrow the collection reference")

    // Borrow an authenticated NFT from the CollectionPublic interface
    let authNFTRef = collectionRef.borrowAuthNFT(id: nftID)
       

    return authNFTRef
    
}