// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract numGiven {

// 1) Create a function named ‘numgive()’ that takes an int type value from the user and
// returns an output value of int data type.


function numgiv(int _num) public returns(int _number){
// 2) In the 'numgive()' function, declare three int-type local variables: 'neg',
// 'positiveEven', and 'positiveOdd'.

int neg;
int positiveEven;
int positiveOdd;

// 3) Within the function, implement an if/else-if conditional with the following three
// conditions:
// a. If the user input is a negative number, store the value in 'neg' and return
// 'neg'.

if(_num <0){
_num = neg;
 emit localVar("neg variable is returning the value");
return neg;

// b. If the user input is a positive even number, store the value in 'positiveEven'
// and return 'positiveEven'.
}else if(_num % 2 == 0){
    _num = positiveEven;
    emit localVar("positiveEven variable is returning the value");
    return positiveEven;
}

// c. If the user input is a positive odd number, store the value in 'positiveOdd' and
// return 'positiveOdd'.
else if(_num % 2 == 1){
    _num = positiveOdd;
     emit localVar("positiveOdd variable is returning the value");
    return positiveOdd;
}

}

event localVar(string message);
}
// 4) Create an event named ‘localVar’ having a string type parameter named ‘message’.
// 5) Within the 'numgive()' function's conditions, emit the 'localVar' event before each
// return statement, including a descriptive message indicating which local variable is
// returning the value.

