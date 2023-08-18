// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
// TASK
// Develop three Solidity contracts: ‘Engine’, ‘Transmission’, and ‘Car’, where ‘Car’ inherits from
// both ‘Engine’ and ‘Transmission’.
// Implement attributes like ‘horsepower’ in ‘Engine’ and ‘gearType’ in ‘Transmission’.
// Create a ‘Car’ instance that inherits features from both ‘Engine’ and ‘Transmission’ and
// demonstrate accessing and displaying these combined attributes.

contract engine {
    uint horsePower;

    constructor(uint _horsePower){
        horsePower = _horsePower;
    }
}

contract transmission {
    string gearType;
    constructor(string memory _gearType){
        gearType = _gearType;
    }
}

contract Car is engine, transmission {
    constructor(uint _horsePower,  string memory _gearType) engine(_horsePower) transmission(_gearType){}

    function print() public view returns(uint, string memory){
        return (horsePower,gearType);
        }

}



contract caller {
    Car car = new Car(1500, "manual");

    function print() public view returns(uint, string memory){
        return car.print();
    }
}
