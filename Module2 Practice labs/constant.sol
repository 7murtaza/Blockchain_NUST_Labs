// SPDX-License-Identifier: MIT
// compiler version must be greater than or equal to 0.8.17 and less than 0.9.0
pragma solidity ^0.8.17;


contract constantTask {
    uint public constant PI = 31415;

    function calculateArea(uint radius) public pure returns(uint){
      uint area = PI/10000 * radius * radius;
      return area;
    }
}