// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract Private{
string public  privatemsg = "Private Variable is Called";
function getprivate() private view returns(string memory){
return privatemsg;
}
function getprivatevar() public view returns(string memory){
return privatemsg;
}
function getprivatefunc() public view returns(string memory){
//You are calling 'getprivate()' function here
//It returns a string value which is then returned by the
//'getprivatefunc()' function
return getprivate();
}
}
// Create a child contract of ‘Private’ named ‘Private2’. Deploy it and observe which of the
// state variables and functions were inherited from the parent contract.
//  In the ‘Private2’ contract. Create a function that modifies the value of the ‘privatemsg’
// variable in the parent contract. Is it possible?
//  In the ‘Private’ contract, replace the private visibility of the ‘privatemsg’ variable with
// public. Deploy the ‘Private2’ contract again and observe what changes you get

contract Private2 is Private {
    function modify() public {
        privatemsg = "Inherited in the child contract";
    }

}