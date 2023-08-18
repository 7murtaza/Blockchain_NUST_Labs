// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract Base {
 string public base = "Base Contract";
 function foo() public view virtual returns (string memory) {
 return base; }
}
contract Middle is Base {
 string public middle = "Middle Contract";
 function foo() public view virtual override returns (string memory) {
 return middle; }
}
contract Derived is Middle {
 string public derived = "Derived Contract";
 function foo() public view virtual override returns (string memory) {
 return derived; }
}

// TASK
// Create three Solidity contracts: ‘BaseUser’, ‘Moderator’, and ‘Admin’, with Moderator
// inheriting from ‘BaseUser’, and ‘Admin’ inheriting from ‘Moderator’.
// Model a content management system on the blockchain using multi-level inheritance to
// manage user roles and permissions.
// Deploy ‘Admin’ and showcase the inherited functions and attributes.


contract BaseUser{
    address baseUserAddress ;
    error log(address);
    function print() public view virtual{
        revert log(baseUserAddress);
    }
}
contract Moderator is BaseUser{
    string name = "moderator";
    error log2(address, string);
    function print() public view virtual override {
      revert log2(baseUserAddress, name);
    } 
}
contract Admin is Moderator{
    uint pin = 1234;
    error log3(address, string, uint);
    function print() public view virtual override {
        revert log3(baseUserAddress, name, pin);
    }
}