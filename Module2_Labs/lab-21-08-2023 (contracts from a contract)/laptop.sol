// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract Name {
//     1) Define a struct Laptop that includes multiple data types as its members.
// 2) Write a Solidity function to encode an array of your defined struct using ABI
// encoding.

struct laptop{
    string name;
    string model;
    uint ram;
    uint rom;
    string processor;
}

laptop public lp = laptop("hp", "elitebook", 8, 512, "core i5");

function encode() public  view returns(bytes memory) {
    
    return abi.encode(lp.name, lp.model, lp.ram, lp.rom, lp.processor);

}
}