// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Event {
 // Event declaration
 // Up to 3 parameters can be indexed.
 // Indexed parameters helps you filter the logs by the indexed parameter
 event Log(address indexed sender, string msg);
 event AnotherLog();
 function test() public {
 emit Log(msg.sender, "Hello Web3.0");
 emit Log(msg.sender, "It's all about Decentralization");
 emit AnotherLog();
 }
 event info(string Name, address ContractAddress, string Department);
 function test2() public {
     
 emit info("murtaza", msg.sender, "Blockchain");
 }
}