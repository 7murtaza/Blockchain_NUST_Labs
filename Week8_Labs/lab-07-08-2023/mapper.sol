// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


contract mapper {
    
//     Make a contract named ‘Mapper’. In it make a mapping, that has ‘keyType’ string (which 
// will represent name of a Wallet) and ‘valueType’ uint (which will represent the balance of the 
// account). Name the mapping as NameToBalance.


mapping(string => uint) public a;

// In the contract named ‘Mapper’. Make a function named ‘set’ that assigns a value to the 
// mapping.

function set(string memory _wallet, uint _balance) public {

    a[_wallet] = _balance;

}


// In the contract named ‘Mapper’. Make a function named ‘get’ that gives you the value of a 
// mapping.

function get(string memory walllet) public view returns(uint){
    return a[walllet];
}

// In the contract named ‘Mapper’. Make a function named ‘reset’ that resets the value of a 
// mapping.

function reset(string memory wallet) public {
    delete a[wallet];

}


}