// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Patient{

// TASK
// Develop a Hospital Management System using Solidity. The system should allow the
// creation of patient records and store them in a list. Each patient record should contain their
// ‘name’, ‘age’ and ‘disease’. The system should provide a way to initialize the patient
// records and retrieve the details of the stored patients.


    string public patientName;
    uint public patientAge;
    string public disease;

    constructor(string memory _patientName, uint _patientAge, string memory _disease ) {
        patientName = _patientName;
        patientAge = _patientAge;
        disease = _disease;

    }

}

contract Person is Patient{
    
    Patient[] public patient;

    constructor(string memory _patientName, uint _patientAge, string memory _disease) Patient( _patientName, _patientAge, _disease){
        Patient p = new Patient(_patientName, _patientAge, _disease);
        patient.push(p);
    }


    function createPatientDetails(string memory _patientName, uint _patientAge, string memory _disease) public {
        Patient p = new Patient(_patientName, _patientAge, _disease);
        patient.push(p);
    }


    function get(uint _index) public view returns(string memory _patientName, uint _patientAge, string memory _disease) {
        require(_index<patient.length, "index out of bound");
        Patient p = patient[_index];
        return (p.patientName(), p.patientAge(), p.disease());
    }


}