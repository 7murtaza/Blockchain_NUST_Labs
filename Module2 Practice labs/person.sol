// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Person{
    string public firstName;
    string public lastName;

    function setFullName(string memory fn, string memory ln) public returns(string memory){
        firstName = fn;
        lastName = ln;
       string memory fullName = string(abi.encodePacked(firstName, " ", lastName));
        return fullName;
    }
    function getFullName() public view returns (string memory){
        return string(abi.encodePacked(firstName, " ", lastName));
    }

} 