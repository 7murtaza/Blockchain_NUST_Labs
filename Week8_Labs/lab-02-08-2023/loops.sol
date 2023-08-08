// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Loop {
    uint256[] data;

    function loop() public returns (uint256[] memory) {
        for (uint8 i = 0; i < 20; i = i + 1) {
            if (i % 2 == 1) {
                data.push(i);
            }
        }
        return data;
    }
    // function getter()public view returns(uint[] memory){
    //     return data;
    // }
}


contract ControlFlow {

/*
    1. Deploy, observe and explain the following code.
2. Instead of while loop, use for loop and then do while loop, separately.
3. Try to return other variants of the unit and observe what happens.
4. Explain the difference between while and do while loop
*/
    // while
    function whileTest() public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        while (i < 15) {
            sum += i;
            i++;
        }
        return (sum);
    }

    function forloopTest() public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        for (i; i<15; i++)
        sum += i;
        return (sum);
    }

    function doWhileTest() public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        do {
        sum += i;
        i++;
        } while (i<15);
        return (sum);
    }

}
