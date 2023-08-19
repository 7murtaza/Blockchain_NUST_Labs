// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract dynamicArr {
    

//     TASK
// Create a contract involving a dynamic array. Construct a function for adding elements to the
// array (push), and another function for removing elements (pop). In the pop function, include
// an assert statement to stop users from trying to pop when the array is empty.


uint[] public arr;

function push(uint _num) public {

    arr.push(_num);

}

function pop() public {
    arr.pop();
    assert(arr.length>0);
}


}