// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract  IntegerChecker{

    function checkInt(int num) public pure returns (string memory){
        if(num >= 0 && num < 256){
            return "uint";
        }
        else if(num<0 && num>(-256)){
            return "int";
        }
        else{
            return "use other data types with that stores more than -256 and 256";
        }
    }

}