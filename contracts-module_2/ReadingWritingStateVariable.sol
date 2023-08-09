// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract SimpleStorage {
    // State variable to store a number
    uint256 public num;

    function input(uint256 _num) public {
        num = _num;
    }

    function output() public view returns (uint256) {
        return num;
    }
}
// 1) Run, observe and explain the following code
// 2) How much transaction fee did you pay to deploy this contract?
    //ANS: 50283
// 3) What are professional terms used for input() and output() functions?
    //ANS: input = setter and output = getter;
