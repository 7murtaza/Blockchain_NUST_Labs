// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// TASK
// 1) Make a library for finding Sum, Difference, Power functions.
// 2) Make a separate contract and utilize the functions available in the library.


library maths{
    function sum(uint _num1, uint _num2) public pure returns (uint _sum){
        return _sum = _num1 + _num2;
        
    }
    function difference(int _num1, int _num2) public pure returns (int _difference){
       require(_num2<_num1 && _num1 >0 && _num2>0, "out of bound or neg number inputted");
        return _difference = _num1 - _num2;
        
    }
    function power(uint _num1, uint _num2) public pure returns (uint _power){
        return _power = _num1 ** _num2;
        
    }

}


contract useOfLibrary {
    
    function findSum(uint _num1, uint _num2) public pure returns (uint _sum){
        return maths.sum(_num1, _num2);
    }

    event SuccessStatus();
    event catchEvent(string message);

    function findDifference(int _num1, int _num2) public returns (int _diff) {
    try maths.difference(_num1, _num2) {
        emit SuccessStatus();
        return maths.difference(_num1, _num2);
    }catch Error(string memory message){
        emit catchEvent(message);
        revert(message);
    }
    }

    function findExpo(uint _num1, uint _num2) public pure returns (uint _expo){
    
        return maths.power(_num1, _num2);
    }


}