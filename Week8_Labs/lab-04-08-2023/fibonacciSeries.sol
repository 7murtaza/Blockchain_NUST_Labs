// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract FibonacciSeries {
    function generateFibonacci(uint256 n) public pure returns (uint256[] memory)
    {
        uint256[] memory fibonacciSeries = new uint256[](n);
        if (n >= 1) {
            fibonacciSeries[0] = 0;
        }
        if (n >= 2) {
            fibonacciSeries[1] = 1;
        }

        for(uint i =2; i<n; i++){
            fibonacciSeries[i] = fibonacciSeries[i-1] + fibonacciSeries[i-2];
        }

        /********************** Change this Part Only ********************************
1. Initialization: unit i = 2.
2. Condition : i < n
3. Formula: fibonacciSeries[i] = fibonacciSeries[i - 1] + 
fibonacciSeries[i - 2];
4. Increment : i++
******************************************************************************
*/
        return fibonacciSeries;
    }
}
