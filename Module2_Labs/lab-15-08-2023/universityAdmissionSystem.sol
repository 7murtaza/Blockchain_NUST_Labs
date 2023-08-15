// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract admissionSystem {
    
//  TASK
// You are assigned a task to create a smart contract that simulates a university admission
// system. Your goal is to allow students to select their desired academic department only if they
// have passed their admission.


//  Declare an enum named Department with options: Civil, Mechanic, Electrical, Software.
//  Establish two mappings: admissionStatus to track student admission status (uint =>
// boolean) and chosenDepartment to record chosen departments (uint => Department).

enum Department{
    Civil,
    Mechanic,
    Electrical,
    Software
}

Department public department;

mapping(uint => bool) public admissionStatus;
mapping(uint => Department) public chosenDepartment;


//  Implement the setAdmissionStatus function with parameters:
    // o student (student's ID)
    // o hasPassed (boolean indicating admission status)
// Use this function to set a student's admission status using admissionStatus mapping.

function setAdmissionStatus(uint _student, bool _hasPassed) public {
    admissionStatus[_student] = _hasPassed;
}

//  Implement the chooseDepartment function with parameters:
    // o student (student's ID)
    // o selectedDept (selected 'Department')

function chooseDepartment(uint _student, Department _selectedDept) public {
    assert(admissionStatus[_student] == true);

    chosenDepartment[_student] = _selectedDept;


}

//  Before assigning the chosen department employ the assert statement to verify that the
// student has met admission requirements (admissionStatus[student] is true).


//  If the assertion holds, proceed to assign the chosen department using the
// chosenDepartment mapping.
}