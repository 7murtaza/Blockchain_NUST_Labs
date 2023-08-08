// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract calldataDloc {
    function fCalldata(uint256[] calldata _x)
        public
        pure
        returns (uint256[] calldata)
    {
        // _x[0] = 0;
        return (_x);
    }
}
