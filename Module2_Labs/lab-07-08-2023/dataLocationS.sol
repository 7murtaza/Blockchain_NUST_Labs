// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StorageDLoc {
    uint256[] arr = [1, 2, 3]; // state variable

    function fStorage() public view  {
        // Declare a local storage variable xStorage
        uint256[] memory xStorage = arr;
        xStorage[0] = 100;
    }

    function get() public view returns (uint256[] memory) {
        return arr;
    }
}

