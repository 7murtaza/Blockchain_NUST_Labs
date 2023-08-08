// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ForLoop {
    int256[6] public arr = [-9, 8, 7, -2, 1, 0];
    int256[] public positarr; // 8, 7, 1 
    int[] public negarr; // -9, -2

    

    function negativepart() public {
        for (uint i = 0; i<arr.length; i++){
            if(arr[i]<=0)
            negarr.push(arr[i]);
        }
    }
    
    function positivepart() public {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] >= 0) {
                positarr.push(arr[i]);
            }
        }
    }

    function getterNegArr() public view returns(int[] memory){
        return negarr;
    }

    function getposit() public view returns (int256[] memory) {
        return positarr;
    }
}
