// 1. Create a struct ‘CAR’ with the attributes of Make, model and Variant.
// 2. Create a function initCar1() functions that creats a storage struct reference within a
// function.
// 3. Create a function initCar2() functions that creats a memory struct copy within a
// function.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract CARs{

    struct CAR{
        string Make;
        string model;
        uint Varient;
    }


CAR public car; 

constructor(string memory _make, string memory _model, uint _varient) {
    _make = car.Make;
    _model = car.model;
    _varient = car.Varient;

}
function initCar1() public returns (CAR memory state, CAR memory local) {
 CAR storage _car = car;
 _car.model = "Ppp" ;
 return(car, _car);
 
}
function initCar2() public view returns (CAR memory state, CAR memory local) {
 CAR memory _car = car;

 _car.Varient = 1000;

 return (car, _car);
}
}
