// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// TASK
// Create a simple Solidity contract named ‘PaymentContract’ with a payable function called
// ‘receivePayment’.
// The function should accept incoming Ether and emit an event indicating the sender's address
// and the amount of Ether received.

contract paymentContract {
    event details(address _sender, uint256 _amountRecieved);

    // mapping(address=>uint) public balance;
    address payable _sender;
    constructor() payable{
        _sender = payable(msg.sender); 
    }
    function receivePayment() public payable{ 

    emit details(_sender, address(this).balance);

 }
    function getBal() public view returns (uint) {
        return address(this).balance;
    }
}