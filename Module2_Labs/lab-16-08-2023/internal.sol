// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Internal {
    // string internal internalmsg = "Internal Variable is Called";
    string public internalmsg = "Internal Variable is Called";

    function getinternal() internal view returns (string memory) {
        return internalmsg;
    }

    function getinternalvar() public view returns (string memory) {
        return internalmsg;
    }

    function getinternalfunc() public view returns (string memory) {
        return getinternal();
    }
}
// Observe and deploy the above given ‘Internal’ contract. Run each of its functions
// available to you and observe what they do.
//  Create a child contract of ‘Internal’ named ‘Internal2’. Deploy it and observe which of
// the state variables and functions were inherited from the parent contract.
//  In the ‘Internal2’ contract. Create a function that modifies the value of the ‘internalmsg’
// variable in the parent contract. Is it possible? //yes it is possible.
//  In the ‘Internal’ contract, replace the internal visibility of the ‘internalmsg’ variable with
// public. Deploy the ‘Internal2’ contract again and observe what changes you get

contract Internal2 is Internal{
     
     function modify() public returns(string memory) {
         internalmsg = "google";
         return internalmsg;
     }

}