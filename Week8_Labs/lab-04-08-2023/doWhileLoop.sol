// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Loop {
    //The value of cond that you will input will decide
    //the number of times the loop is run
    function iterate(uint256 cond) public pure returns (uint256) {
        uint256 i;
        uint256 iteration;
        do {
            iteration++;
            i++;
        } while (i < cond);
        //If you input the value of 'cond' as 0, the condition will be false
        //on the first try, however you will notice that the loop still runs once
        return iteration;
    }
/*
a) Observe and deploy the contract given in the above example.
    b) If you input ‘18’ during the function call of the ‘iterate()’ function, what value will be 
    returned to you?
    ANS: 18
        c) If you input ‘0’ during the function call of the ‘iterate()’ function, why is ‘0’ value not 
        returned to you?
        ANS: 0
*/
}
