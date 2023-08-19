// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Revert{

// TASK
// Now, develop ‘QuotientCalculator’, but now use ‘revert’ statement to ensure the non-zero
// _denominator before division

function QuotientCalculator(uint _numerator, uint _denominator) public pure returns (uint) {

    if(_denominator == 0){
        revert("Cannot divide by Zero");
    }
    uint Quotient = _numerator / _denominator;

    return Quotient;


}


}