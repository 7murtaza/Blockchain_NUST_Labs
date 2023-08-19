// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract driverLicence {
    
// TASK
//  Create a `DriverLicense` contract with a custom error, `TooYoung`, consisting of a
// relevant error message (`message` of string) and a minimum age requirement
// (`RequiredAge` of uint).

    error tooYoung(string message, uint requiredAge);

//  Implement the `DriverID()` function, which takes `age` as input and returns a driverID
// (any uint number of your choice), if the age is equal to or greater than 18. Otherwise,
// triggers the `TooYoung` custom error.

    function driverID(uint _age) public pure returns (uint driver){

        if(_age <18){
            revert tooYoung("Too young to get a driver licence", _age);
        }
        driver = 5000;
        return driver;


    }

}