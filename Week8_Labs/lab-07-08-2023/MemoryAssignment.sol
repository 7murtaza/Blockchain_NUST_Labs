// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract MemoryAssignment {
    function modifyMemory(uint256[] memory originalArray)
        public
        pure
        returns (uint256[] memory)
    {
        // Assign the input array to a new variable in memory
        uint256[] memory newArray = originalArray;
        // Modify a value within the new array
        if (newArray.length > 0) {
            newArray[0] = 999;
        }
        return originalArray; // Return the original array
    }

}
// Does modifyMemory() function create copy or reference?
// yes it does creates reference of the orignal array, and modifying the newArray also changes the orignialArray; 
