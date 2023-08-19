// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Base {
    uint256 public x;

    function setX(uint256 _x) public {
        x = _x;
    }
}

contract DerivedA is Base {
    function getX() public view returns (uint256) {
        return x;
    }
}

contract DerivedB is Base {
    function getXTimesTwo() public view returns (uint256) {
        return x * 2;
    }
}

// TASK
// 1) Deploy and observe each of the above smart contracts.
// 2) Create DerivedC involving a function that returns a cube of x.

contract DerivedC is Base {
    function getXTimesCube() public view returns (uint256) {
        return x * x * x;
        // return x ** 3 ;
    }
}

// TASK
// Design a set of Solidity contracts representing ‘Car’, ‘ElectricCar’, and ‘HybridCar’, with
// ‘ElectricCar’ and ‘HybridCar’ inheriting from ‘Car’.
// Implement basic attributes like ‘model’, ‘make’, and specific attributes like ‘batteryCapacity’
// for ‘ElectricCar’ and ‘gasTankCapacity’ for ‘HybridCar’. Deploy instances of each type of car
// and demonstrate the inherited attributes.

contract Car {
    string model;
    string make;

    constructor(string memory _model, string memory _make) {
        model = _model;
        make = _make;
    }

    function print() public view virtual returns (string memory) {
        return "Car initialized";
    }
}


contract ElectricCar is Car {
    uint256 batteryCapacity;
    constructor(string memory _model, string memory _make) Car(_model, _make) {}

    function set(uint _batteryCapacity) public returns(string memory, string memory, uint){
        batteryCapacity = _batteryCapacity;
        return (model, make, batteryCapacity);
    }
     function print() public view virtual override  returns (string memory) {
        return "electric car initialized";
    }
}


contract HybridCar is Car("y", "Tesla") {
    uint gasTankCapacity = 50;
    constructor() {}

    function getter() public view virtual returns(string memory, string memory, uint){
    return (model, make, gasTankCapacity);

    }
    function print() public view virtual override  returns (string memory) {
        return "hybrid car initialized";
    }
}
