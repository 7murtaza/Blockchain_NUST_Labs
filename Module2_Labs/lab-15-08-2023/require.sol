// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract OwnerShipTransfer{
 mapping(uint256 => address) private owners;
 function transferOwner1(uint256 ID, address newOwner) public {
 require(owners[ID] == msg.sender, "Transfer Not Owner");
 owners[ID] = newOwner;
 }
}



//  TASK:
// Create a Solidity smart contract named InputValidator. Inside the contract, define a function
// named Transfer that takes an uint256 ‘amount’, address ‘recipient’.
   // The function should be capable of transferring the amount from the account of msg.sender to
// the account of the recipient.
// Use the ‘require’ statement to ensure that the amount is greater than 0 AND less than 100. (0-
// 100)
contract InputValidator{

    mapping(address=>uint) public balance;

    function Transfer(uint256 _amount, address _recipient)public {
        require(_amount > 0 && _amount <100, "Balance should be in-between 0 and 100 ");
        balance[msg.sender] = 10000;
        balance[msg.sender] -= _amount;
        balance[_recipient] +=_amount;
    }

 
}
    
// TASK:
// Develop the ‘QuotientCalculator’ contract with the ‘calculateQuotient’ function.
// Use a ‘require’ statement to ensure the non-zero _denominator before division, reverting with
// an error if it's zero
// Dividend ÷ Divisor


contract QuotientCalculator{

    function calculateQuotient(uint _numerator, uint _denominator) public pure returns(uint){

        require(_denominator == 0, "cannot divide by 0");

        uint quotient = _numerator / _denominator;

        return quotient;

    }

}