// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Student {
 string public   stdName;
 uint public  stdRollNum;
 // setting values of state variables
 constructor (string memory name,uint rollNum) {
 stdName = name;
 stdRollNum = rollNum; }
}


contract StudentsList {
 // array to store students ( composition )
 Student[] public students;
 constructor () {
 Student newStudent = new Student("Burak", 20);
 students.push(newStudent);
}

function get(uint _index) public view returns (string memory,uint) {
    
    Student std = students[_index];

    return (std.stdName(), std.stdRollNum());

}


}
