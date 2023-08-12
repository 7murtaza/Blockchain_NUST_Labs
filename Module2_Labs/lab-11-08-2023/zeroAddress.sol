// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract zeroAddress{
    address public owner;

    event zeroAddressInput(string message);

    constructor(address _addr) {
    if(_addr == 0x0000000000000000000000000000000000000000)
    emit zeroAddressInput("Zero Address inputted on deployment of contract");
    _addr = owner;
    }

}


// Create a contract that emits an event when the user assigns a zero address (an address
// consisting of only zeros) to the ‘owner’ state variable (address data type) on deployment of the
// contract.

















// Hint:
// ● Your event can have only one parameter of string type that emits a statement
// like “Zero Address inputted”.

// ● The statement states ‘on deployment of contract’, so you will make a ‘constructor’
// that takes input from the user.

// ● Using if condition, you can check whether user input is a zero address in the

// ● Inside the if condition you can emit your event.
