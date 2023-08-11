//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UintArrayExample {
    uint[] public uintArray;

    // Function to set a value in the array at a specific index
    function setValueAtIndex(uint index, uint value) public {
        require(index < uintArray.length, "Index out of bounds");
        uintArray[index] = value;
    }

    // Function to get a value from the array at a specific index
    function getValueAtIndex(uint index) public view returns (uint) {
        require(index < uintArray.length, "Index out of bounds");
        return uintArray[index];
    }

    // Function to get the length of the array
    function getArrayLength() public view returns (uint) {
        return uintArray.length;
    }

    // Function to append a value to the end of the array
    function appendValue(uint value) public {
        uintArray.push(value);
    }
}