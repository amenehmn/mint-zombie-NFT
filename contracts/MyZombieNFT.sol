// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.1;

// We need some util functions for strings.
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We need to import the helper functions from the contract that we copy/pasted.
import { Base64 } from "./libraries/Base64.sol";


contract MyZombieNFT is ERC721URIStorage {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  uint public totalMintCount;
  
  event NewZombieNFTMinted(address sender, uint256 tokenId);

  constructor(uint TOTAL_MINT_COUNT) ERC721 ("AmnZombieNFT", "ZMB") {
    totalMintCount = TOTAL_MINT_COUNT;
    console.log("This is my NFT contract. Woah!");
  }


  function makeAnZombieNFT() public {
    uint256 newItemId = _tokenIds.current();

    require(newItemId <= totalMintCount, "All the tokens have been minted.");
    

    _safeMint(msg.sender, newItemId);
  
    // We'll be setting the tokenURI later!
    _setTokenURI(newItemId, "ipfs://QmakyVsBdrio9Cd65B4x6CcNHkv8GhFS2eE6ZwEErro8yM");
  
    _tokenIds.increment();
    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);
	
	emit NewZombieNFTMinted(msg.sender, newItemId);
  }
}