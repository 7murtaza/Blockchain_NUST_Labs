// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
//  Observe and deploy the above contract.
//  Make a custom error, having parameters ‘message’ (string data type) and ‘num’(uint
// data type).
//  Insert a revert statement with the custom error you have just made in the ‘upush()’
// function. The error should return a message indicating that the number is not prime
// along with the number itself.
contract CustomError {
    uint256[] public arr;
    error customError(string message, uint num);
    function upush(uint256 num) public {
        if (IsPrime(num)) {
            //Insert Revert Statement Here
            revert customError("the number is not prime", num);
        }
        arr.push(num);
    }

    function IsPrime(uint256 num) public pure returns (bool) {
        if (num == 0 || num == 1) {
            return false;
        }
        for (uint256 i = 2; i <= num / 2; i++) {
            if (num % i == 0) {
                return true;
            }
        }
        return false;
    }
}
