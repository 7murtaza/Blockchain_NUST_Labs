// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Loop {
    uint256[] public arr;

    function NaturalNum(uint256 max) public returns (uint256[] memory) {
        uint256 i = 4;
        while (i <= max) {
            arr.push(i);
            i+=4;
        }
        return arr;
    }
    function getter() public view returns(uint[] memory)
    {
        return arr;
    }
}
