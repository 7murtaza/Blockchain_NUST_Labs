//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
import "./Explibrary.sol";
import "./sumContract.sol";

contract LibraryClient {
    function GetExponential(uint256 firstVal, uint256 secondVal)
        public
        pure
        returns (uint256)
    {
        return Explibrary.exponential(firstVal, secondVal);
    }

    SumContract public sc = new SumContract();
    function Sum(uint256 firstVal, uint256 secondVal)
        public view
        returns (uint256)
    {
        return sc.sum(firstVal, secondVal);
    }
}
