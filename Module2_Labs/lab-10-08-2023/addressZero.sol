// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;




contract addressEvent{
    
// Create a contract that emits an event when the user assigns a zero address (an address
// consisting of only zeros) to the ‘owner’ state variable (address data type) on deployment of the
// contract.

address public owner;
event log(string message);

constructor(address _addr) {
    _addr = owner;
    if(_addr == 0x0000000000000000000000000000000000000000){
    emit log("Zero Address inputted on deployment of contract");

    }
}



}