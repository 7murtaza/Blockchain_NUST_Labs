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

CAR car;

function initCar1() public  {
    CAR storage _car = car;
    _car.Make = "Toyota";
    _car.model = "Prado";
    _car.Varient = 2000;

}
function initCar2() public  {
    CAR memory _car = car;
    car.Make = "Tesla";
    car.model = "Y";
    car.Varient= 1000;
    CAR memory _ref = _car;
    _ref.Make = "Toyota";
}

function getter() public returns (CAR){
 return initCar1();
}
}
