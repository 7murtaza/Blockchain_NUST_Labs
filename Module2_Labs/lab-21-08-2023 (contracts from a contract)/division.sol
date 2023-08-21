// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


// TASK
// Develop a Solidity smart contract that includes two contracts: SimpleDivision and
// TryCatchExample. The SimpleDivision contract provides a function Divide2Nums for
// dividing two input numbers.
// The TryCatchExample contract interacts with SimpleDivision and implements error
// handling using the try-catch mechanism.


contract simpleDivision {
    

    function divide2Nums(uint _num1, uint _num2)public pure {
        require(_num2 !=0, "error cannot divide by zero");
       _num1 / _num2;
    }

}

contract  tryCatchExample{
    
    event SuccessEvent();
    event CatchEvent(string message);
    simpleDivision sd = new simpleDivision();
    
    function trycatch(uint _num1, uint _num2) public {
    try sd.divide2Nums(_num1, _num2){
        emit SuccessEvent(); 
    }catch Error(string memory message){
        emit CatchEvent(message);
    }
        
    }
}