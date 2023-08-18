// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract External {
    // string external externalmsg = "External Variable is Called";
    function getexternal() external pure returns (string memory) {
        return "External Function";
    }
    // function getexternalfunc() public view returns(string memory){
    // return getexternal();
    // }
}
// Observe and deploy the above given ‘External’ contract. Run each of its functions
// available to you and observe what they do.
//  Uncomment the ‘externalmsg’ variable and ‘getexternalfunc()’ function. You get errors,
// why is that?
//  Create a child contract of ‘External’ named ‘External2’. Deploy it and observe what was
// inherited from the parent contract.
//  Copy the ‘getexternalfunc()’ function in the parent contract and paste it in the ‘External2’
// contract. Uncomment it and deploy the contract. Will it run now?

contract External2 is External {
    function getexternalfunc() public view returns(string memory){
    // return getexternal();
    }

}