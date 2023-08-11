// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract MerkleTree {
    uint256[] public arr= [1, 2, 3, 4];

    function Tree() public  returns (uint256) {
        while (arr.length > 1) {
            uint256[] memory newLayer = new uint256[](arr.length / 2);
            uint256 newIndex = 0;

            for (uint256 i = 0; i < arr.length; i += 2) {
                if (i + 1 < arr.length) {
                    newLayer[newIndex] = arr[i] + arr[i + 1];
                } else {
                    newLayer[newIndex] = arr[i];
                }
                newIndex++;
            }

        arr = newLayer;
        }

        return arr[0]; 
    }

    function getter()public view returns(uint){
        return arr[0];
    }

}
pragma solidity ^0.8.17;

contract MerkleTrese {
    uint[] public arr =[1,2,3,4];
    uint public root;

    function root2() public returns (uint) {
        while(arr.length>1){
            uint[] memory arr2 = new uint[](arr.length/2);
            uint indexArr2;
            for(uint i=0; i<arr.length; i+=2){
                if(i + 1 <arr.length)
                arr2[indexArr2] = arr[i] + arr[i+1];
                else
                arr2[indexArr2] = arr[i];
            indexArr2++;
            }

        arr= arr2;
        //arr[3,7] = 2
        }
        return arr[0];
        
    }


}
