// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ForLoop {
    uint256[] public numtable;

    function table(uint256 num) public {
        uint256 temp = num;
        for (uint256 i = 1; i <= 10; num += temp) {
            numtable.push(num);
            i++;
        }
    }

    function get() public view returns (uint256[] memory) {
        return numtable;
    }

    function resetarr() public {
        delete numtable;
    }

//a) Run and observe the contract given in the above example.


//b) Run and observe all the functions, through your observation explain what 
//does the ‘resetarr()’ function do.
    // --> resetarr() resets the array to its initial state, it deletes all elements.

//c) If you want to get the table of a number till ‘20’, instead of ‘10’, what change 
//will you make in the ‘table()’ function.
    // --> Change i <= 10; to i <= 20;

//d) In the for loop, if you swap i++ in the iteration part and num += temp at the 
//final line of the loop body, what will happen?
    // --> nothing will , the loop will continue to work;
}