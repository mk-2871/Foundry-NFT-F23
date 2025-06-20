// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
    uint256 private s_tokenCounter;
    string private s_sadSvg;
    string private s_happySvg;

    enum Mood {
        SAD,
        HAPPY
    }

    mapping(uint256 => Mood) private s_tokenIdToMood;

    constructor(
        string memory sadSvgImageUri,
        string memory happySvgImageUri
    ) ERC721("Mood NFT", "MN") {
        s_tokenCounter =0;
        s_sadSvgImageUri = sadSvgImageUri;
        s_happySvgImageUri = happySvgImageUri;
    }

    function mintNft() public {
        _safemint(msg.sender, s_tokenCounter);
        s_tokenIdToMood(s_tokenCounter)=Mood.HAPPY;
        s_tokenCounter++;
    }

    function tokenURI(
        uint256 tokenId
    ) public view overrides returns (string memory){
        string memory tokenMetadata = string.concat(
            '{"name": "',
            name(),
            '", "description": "An NFT that represents your mood.", "attributes": [{"trait_type":',
            imageURI,
            '"}'
        );

    }

}