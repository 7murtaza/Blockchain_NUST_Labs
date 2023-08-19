// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Public {
    string public publicmsg = "Public Variable is Called";

    function getpublic() public view returns (string memory) {
        return publicmsg;
    }
}

// Create a child contract of ‘Public’ named ‘Public2’. Deploy it and see which of the state
// variables and functions were inherited from the parent contract.
    // both the state variable and getpublic() function were inherited 


contract Public2 is Public{

}