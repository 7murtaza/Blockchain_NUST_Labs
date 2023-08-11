// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract structa {

    struct studentStruct{
        string name;
        uint age;
    }

    mapping (address => studentStruct) student;

    function setName(string memory _name, address _addr) public {
        student[_addr].name = _name;
    }

    function setAge(uint age, address _addr) public {
        student[_addr].age = age;
    }
    
    function setAsge(string memory value) public returns (string memory){
    string memory val = value;
      return val; 
    }
}