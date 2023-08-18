// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Design a Solidity contract named ‘FamilyFortune’. Declare an internal state variable
// ‘inheritance’ of type uint to represent a family inheritance.
//  Implement an internal function ‘addInheritance(uint amount)’ that allows family
// members to contribute to the inheritance pool.

//  Create a child contract named ‘Heir’ that inherits from ‘FamilyFortune’.
//  Inside ‘Heir’, implement a public function that calls the inherited ‘addInheritance()’
// function, allowing an heir to add to the family fortune

contract familyFortune{

    uint internal inheritance;

    function addInheritance(uint _amount) internal {
        inheritance += _amount;
    }

    function get() public view returns(uint) {
    return inheritance;
}}

contract heir is familyFortune{

    function get(uint _amount) public {
      addInheritance(_amount);
    }
}