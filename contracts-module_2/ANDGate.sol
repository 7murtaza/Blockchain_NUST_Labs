//SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract ANDGate{
   
    // function AND(bool a, bool b) public pure returns (bool) {
    //     bool gate = a && b;
    //     return gate;
    // }

bool public _bool = true;
function logicalNot() public view returns (bool) {
return !_bool; }
function logicalAnd() public view returns (bool) {
return _bool && !_bool; }
function logicalOr() public view returns (bool) {
return _bool || !_bool; }
function equality() public view returns (bool) {
return _bool == !_bool; }
function inequality() public view returns (bool) {
return _bool != !_bool; }
}