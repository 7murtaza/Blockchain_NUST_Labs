// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract  IntegerCheckerTernary{

    function checkInt(int num) public pure returns (string memory){
        // if(num >= 0 && num < 256){
        //     return "uint";
        // }
        // else if(num<0 && num>(-256)){
        //     return "int";
        // }
        // else{
        //     return "use other data types with that stores more than -256 and 256";
        // }
        return (num >= 0 && num < 256) ? "uint" : (num<0 && num>(-256)) ? "int" : "use other int data types that stores more than -256 and 256 bits"; 
    }

}