// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract NoPrime {

// 1) Make a contract named ‘NoPrime’. Make a uint type state variable ‘num’, and an event, 
// having only two parameters of string and uint type.

    uint public num; 
    event primeChecker(string s, uint u);

// 2) Create a ‘setter()’ function for the ‘num’ variable that takes input from the user

    function setter(uint _num) public view {
        _num = num;
    }

// 3) Make the ‘check()’ function such that whenever the user inputs a ‘prime number’, it 
// emits a statement informing that a prime number has been inputted along with the prime 
// number itself.

    function primeNumber(uint _numb) public pure returns(bool _n){
        if(_numb<=1)
        return false;

        for (uint i = 2; i <= _numb / 2; i++){
        if (_numb % i == 0)
            return false;
        }
        return true;
    }
    
    function check(uint _num) public {
        if(primeNumber(_num)){
        emit primeChecker("The Number is Prime", _num);
        }else{
        emit primeChecker("The Number is Not Prime", _num);

        }

}}