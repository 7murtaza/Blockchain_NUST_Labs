// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Events {
    enum Quality {
        Good,
        Moderate,
        Bad
    }
    struct specs {
        string microprocessor;
        uint256 RAM;
    }
//A single event can have multiple parameters
 event multi(string laptop, uint price);
 //You can also emit enums and structs as well
 //An event can have upto 3 indexed parameters
 event multiple(string laptop, uint indexed price, Quality indexed q,
specs indexed s);
 //Naming the variable in an event is not necessary
 event mu(string, Quality);

 //You can also emit empty events
 event empty();
 function emits() public{
 emit multi("Hp", 150000);
 emit multiple("dell", 100000, Quality.Good, specs("intel", 128));
 emit mu("Lenovo", Quality.Moderate);
 emit empty();
 }

//  3) Create another event in the ‘contract’ given below that emits the ‘quality’ (of
// Quality data type), ‘spec’ (of specs data type) and ‘ROM’ (of uint data type).


    event custom(Quality, specs, uint);

    function emit2() public {
        emit custom(Quality.Bad, specs("amd", 64), 512);
    }

}