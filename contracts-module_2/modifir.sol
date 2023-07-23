// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Name {
    
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner);
        _;
    }



}