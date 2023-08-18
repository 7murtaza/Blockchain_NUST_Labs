// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Create a Solidity contract named ‘PublicVisibility’. Inside it, declare a public state
// variable ‘publicData’ of type uint.
//  Create a child contract named ‘PublicChild’. In it, implement a public function
// ‘getPublicData()’ that returns the value of ‘publicData’.

contract PublicVisibility{
        uint public publicData;
}

contract publicChild is PublicVisibility{

        function getPublicData() public view returns(uint){
            return publicData;
        }
}