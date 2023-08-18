// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// Create a contract "Bank" with a private state variable "balance" and a public function
// "deposit" that adds funds to the balance.
//  Implement another contract "BankUser" (child contract of “Bank”) that interacts with
// the "Bank" contract by calling the "deposit" function.
//  Attempt to create a ‘get()’ function for "balance" state variable in the "BankUser"
// contract. Is it possible? If not why?

contract bank {
    uint private balance;


    function deposit(uint _addBalance) public {
        balance += _addBalance;
    }

    function get() public view returns(uint) {
        return balance;
    }
}

contract bankUser is bank {
    
    function gets() public view returns(uint) {
        return get();
    }

}