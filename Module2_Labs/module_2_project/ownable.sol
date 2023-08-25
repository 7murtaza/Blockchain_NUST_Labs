// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ownable {
    address public owner;
    event logOwnershipTransfered(address indexed _currentOwner, address indexed _newOwner);
    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }
    




}