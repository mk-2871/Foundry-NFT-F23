// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "lib/forge-std/src/Test.sol";
import {console} from "lib/forge-std/src/console.sol";
import {DeployMoodNft} from "script/DeployMoodNft.s.sol";
import {Base64} from "lib/openzeppelin-contracts/contracts/utils/Base64.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToURI() public view {
        // 1. Define the input SVG string
        string memory svg =
            '<svg xmlns="https://www.w3.org/2000/svg" width="500" height="500"><text x="0" y="15" fill="black">Hi! Your browser decoded this</text></svg>';

        // 2. Construct the expected URI by applying the same logic as the function under test
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(svg));
        string memory expectedUri = string(abi.encodePacked(baseURL, svgBase64Encoded));

        // 3. Call the actual function
        string memory actualUri = deployer.svgToImageURI(svg);

        // 4. Assert that the actual and expected URIs are identical.
        //    Using assertEq gives better error messages than comparing hashes.
        assertEq(actualUri, expectedUri);
    }
}
