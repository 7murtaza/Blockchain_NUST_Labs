// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract generatingLogs {
    
 event Log(address indexed sender, string msg);
 event AnotherLog();
 function test() public {
 emit Log(msg.sender, "Hello Web3.0");
 emit Log(msg.sender, "It's all about Decentralization");
 emit AnotherLog();
 }
}
