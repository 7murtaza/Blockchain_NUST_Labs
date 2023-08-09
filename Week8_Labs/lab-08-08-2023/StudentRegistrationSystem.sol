// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract srs{
    // 1) Create an enum named ‘Department’ with options: ‘Artificial_Intelligence’,
// ‘Blockchain’, ‘E_Commerce’ and ‘Arts’.

enum Department{
    Artificial_Intelligence,
    Blockchain,
    E_Commerce,
    Arts
}

// 2) Create an enum named ‘Status’ with options: ‘Enrolled’, ‘NotEnrolled’,
// ‘Graduated ’and ‘Expelled’.

enum Status{
    Enrolled,
    NotEnrolled,
    Graduated,
    Expelled
}
// 3) Define a struct named ‘Student’ with properties: ‘name’, ‘age’,
// ‘registrationDate’, ‘Department’, ‘Status’ and ‘ObtainedMarks’.
// (ObtainedMarks would be 0 in case of ‘NotEnrolled’ and ‘Expelled’.)

struct Student{
    string name;
    uint age;
    string registrationDate;
    Department department;
    Status status;
    uint ObtainedMarks;
}

// Student[] public students;

// 4) Use a mapping to store student RollNo and their corresponding Student
// struct.

mapping(uint => Student) public std;

// 5) Implement a function to register a student by providing their necessary
// attributes.

function Register(string memory _name, uint _age, string memory _registrationDate, Department _dept, Status
 _status, uint _obtainedMarks, uint _rollNumber) public {

std[_rollNumber] = Student({
    name: _name,
    age: _age,
    registrationDate: _registrationDate,
    department: _dept,
    status: _status,
    ObtainedMarks: _obtainedMarks
    });
}

// 6) Implement a function to update the student’s details by providing RollNo
// and other necessary information.

function update(string memory _name, uint _age, string memory _registrationDate, Department _dept, Status
 _status, uint _obtainedMarks, uint _rollNumber) public {
     Student storage student = std[_rollNumber];

     student.name = _name;
     student.age =_age;
     student.registrationDate =_registrationDate;
     student.department = _dept;
     student.status = _status;
     student.ObtainedMarks =_obtainedMarks;
}

// 7) Implement a function to retrieve the details of a registered student using
// their RollNo.

function getDetail(uint _rollNumber) public view returns(string memory _name, uint _age, string memory _registrationDate, 
Department _dept, Status
 _status, uint _obtainedMarks) {

     Student memory student = std[_rollNumber];

     return(student.name, student.age, student.registrationDate, student.department, student.status, student.ObtainedMarks);

}

// 8) Implement a function to retrieve the count of students registered in ‘each
// department’.

function count() public view returns(){

    return 

}

// 9) Implement a function to retrieve the details of Top 3 Achievers currently
// enrolled in Blockchain.





// NOTE:
// ➔ Ensure that the contract is properly organized with appropriate data
// locations for storage variables.
// ➔ Ensure that the contract is gas-efficient and handles potential edge
// cases gracefully
}