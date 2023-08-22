// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//  Define an interface "Token" with a function "transfer" that takes an address and an amount as
// parameters. Create a contract named "TokenContract".
// "TokenContract" should implement the "Token" interface and provide the logic for the
// "transfer" function.

interface token {
        function transfer(address _to, uint _amount) external ;
    }


contract tokenContract is token{

    mapping(address=>uint) public balance;
constructor(){
        balance[msg.sender] =100;
}

    function transfer(address _to, uint _amount) external {
        require(balance[msg.sender] > 0 && _amount<100, "not enough balance");
        balance[msg.sender] -=_amount;
        balance[_to] += _amount;
    }

}