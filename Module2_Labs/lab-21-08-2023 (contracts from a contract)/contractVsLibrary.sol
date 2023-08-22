// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library Explibrary {
    function exponential(uint256 a, uint256 b) public pure returns (uint256) {
        return a**b;
    }
}

contract SumContract {
    function sum(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
}

contract LibraryClient {
        SumContract public sc = new SumContract();
    function GetExponential(uint256 firstVal, uint256 secondVal)
        public pure 
        returns (uint256)
    {
        return Explibrary.exponential(firstVal, secondVal);
    }

    function Sum(uint256 firstVal, uint256 secondVal)
        public view  
        returns (uint256)
    {
        return sc.sum(firstVal, secondVal);

    }
}
