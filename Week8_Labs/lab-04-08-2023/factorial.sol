// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Factorial {
    function createFact(uint256 n) public pure returns (uint256) {
        uint256 factvalue = 1;
        if (n == 0) {
            factvalue = 1;
            return factvalue;
        }
        //******** Insert For Loop Here***********
        // 4 * 3
        //4 * 3 * 2
        //4 * 3 * 2 * 1
        for(uint i = n; i>=1; i--){
            factvalue *= i;
        }
        return factvalue;
    }
}
