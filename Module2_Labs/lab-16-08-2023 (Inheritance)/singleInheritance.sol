// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Base {
 uint public x;
 function setX(uint _x) private  {
 x = _x; }
}
contract Derived is Base {
 function getX() public view returns (uint) {
 return x; 
 }
}

// 1) Deploy and observe the above smart contract.
// 2) Change Parent function’s (setX) visibility to Private, and observe the change.

// Create a base contract ‘Parent’ with an uint variable ‘parentValue’. Derive a contract ‘Child’
// from ‘Parent’ with an additional uint variable ‘childValue’.
// Deploy ‘Child’ and demonstrate inheritance by accessing both ‘parentValue’ and ‘childValue’.


contract Parent {
    uint parentValue=1;
}

contract Child is Parent{
    uint ChildValue =6;

    function getter() public view returns(uint, uint){

        return (parentValue, ChildValue);
    }

}