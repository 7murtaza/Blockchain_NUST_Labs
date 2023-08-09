// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


contract exerciseOnFunction {
   // Create three separate functions that return your Name, Gender and MetaMask’s wallet
    //address in three different forms as introduced in Section 1.6 point 1,2 and 3.

    function info() public pure returns (string memory , string memory, address){
        return ("gmk", "male", 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 );
    
    }
    function info2() public pure returns (string memory name, string memory Gender, address metamask){

        return ("gmk", "male", 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 );
    }

    function info3() public pure returns (string memory name, string memory Gender, address metamask){

        name = "gmk";
        Gender = "male";
        metamask = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    }

    /*EXERCISE
        Create a Solidity function that takes radius ‘r’ as input and returns the circumference of
        the circle.
        */

        uint pi =  31415 ;
    function circumference(uint r) public view returns (uint c){
         c = 2 * pi * r / 10000;
        return c;
    }

   /* EXERCISE
1) There are some errors in the following code, correct them.
2) Deploy and observe the updated version of code. */

    uint public number = 4;
    // default
    function add() public{
    number += 2;
    }
    
// pure
    function addPure(uint _number) public pure returns(uint tempNum) {
   
   tempNum = _number;
   return tempNum;

    }
// view
    function addView() public view returns (uint){
        // uint s = changeState();

        return number ;

}

// function changeState() public returns (uint num) {    
//     return number += 2;
// }

// function purestate() public pure returns (uint){
//     uint s = changeState();
//     return s;
// }

}

contract exerciseOnArray{
    
//length_method
    /*1) Deploy the following contract
    2) Observe the output of getlength() function and also explain the reason.
*/
    uint[] public arr;
    function getlengths() public view returns(uint){
    return arr.length;
    }
    //reason: the output is 0, and the reason is that the array is dynamic and there are no elements in it.


/* EXERCISE
a) Make a uint type fix-sized array of length 4 named arr1.
b) Convert the 0th and 3rd element of arr1 into 2 and 10 respectively.
c) Make a getter function for arr1.
*/

    uint[4] public arr1;

 function setter(uint _i, uint value) public {
     arr1[_i] = value;
 }
 function getter(uint i) public view returns (uint)
 {
     return arr1[i];
 }


/*EXERCISE
a) Declare a dynamic array of type string named arr2.
b) Using push(), fill the array with your complete name.
c) Return the length of the arr2 array.
d) Using pop() remove the last name.
e) Make a getter function for arr2, that now returns your first name.
*/

string[] arr2;

function push(string memory name) public {

    arr2.push(name);
}

function length() public view returns (uint){
    return arr2.length;
}

function pop() public {
    arr2.pop();
}
function getter() public view returns(string memory firstName){
    return arr2[0];
}


/*EXERCISE
There are 4 errors in the code given below, correct them and then run the updated
version of the code.
*/

int[] public array;
function ipush() public{
    array.push(-5);
    array.push(0);
    array.push(5);
    array.push(10);
}
    function get() public view returns(int[] memory){
    return array;
}
    function getlength() public view returns(uint){
    return array.length;
}


}

contract dArray {
    /*
    Create a Solidity contract that stores a dynamic array of integers. Implement functions to
1. add elements to the array
myarray.push(_number);
2. retrieve elements at specific indices
return myarray[_index];
3. delete elements at specific indices
delete myarray[_index];
4. pop element from array.
myarray.pop();
*/
uint[] public d_Array;

function addElements(uint value) public{
    d_Array.push(value);
}

function findElement(uint i) public view returns(uint value) {
    return d_Array[i];
}

function deleteElements(uint i) public {
    delete d_Array[i];
}

function popElement() public {
    d_Array.pop();
}
}