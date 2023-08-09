// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract mappings{

    struct student
    {
        string name;
        string subject;
        uint8 marks;
    }
     
    // Creating a mapping
    mapping (address => student) result;
    address[] public student_result;
    
}