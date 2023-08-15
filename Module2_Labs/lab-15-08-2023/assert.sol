// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Assert {
    function subtract(uint256 num1, uint256 num2)
        public
        pure
        returns (uint256)
    {
        assert(int(num1) - int(num2) >=0);
        uint sub;
        sub = num1 - num2;
        return sub;
    }
}
