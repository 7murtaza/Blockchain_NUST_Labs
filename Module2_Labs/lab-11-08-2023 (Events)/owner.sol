// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


contract ownerEvents {

// 1) Create a smart ‘contract’ named ‘Eventss’. Declare an address data type state
// variable in it named ‘owner’.

address public owner;

// 2) Make a ‘contructor()’ for the contract that initialized the value of ‘owner’ to be
// msg.sender.

constructor() {
    owner = msg.sender;
}

// 3) Make a ‘NewOwner()’ function that takes an address data type value as input
// from the user and assigns it to ‘owner’.
event owners(address prevOwner, address newOwner);

function NewOwner(address _addr) public   {
    emit owners(owner, _addr);
    _addr = owner;
}

}