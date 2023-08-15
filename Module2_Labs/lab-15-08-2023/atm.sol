// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract atm {
    
// TASK
// Design a smart contract named `ATM` that simulates an Automated Teller Machine (ATM). Your
// objective is to enhance the contract's error handling mechanism by creating a custom error and
// integrating a `revert` statement at the appropriate location.
//  Initialize a ‘CashAvailable’ state variable of type uint with an initial value, representing
// available ATM cash.
//  Define a custom error named `InsufficientFunds` having a relevant error message
// (string type) along with the current cash available in the ATM (uint type).

 uint public cashAvailable = 100;
 error InsufficientFunds(string message, uint cashAvailable);


//  Implement a ‘MoneyWithdraw()’ function that:
// o Accepts a ‘WithdrawAmount’ parameter.
// o Uses an if statement to check if the ‘CashAvailable’ is less than the
// ‘WithdrawAmount’.
// o If the condition is met (i.e., insufficient funds), use the revert statement to trigger
// the custom error ‘InsufficientFund’. Include the error message and the
// ‘CashAvailable’ balance in the revert statement.
// o If sufficient funds are available, deduct the ‘WithdrawAmount’ from the
// ‘CashAvailable’.
//  Implement a ‘ATMRefill’ function that:
// o Accept a ‘RefillAmount’ parameter.
// o Add the ‘RefillAmount’ to the current ‘CashAvailable’ balance

function MoneyWithdraw(uint _withDrawAmount) public {
    if (cashAvailable < _withDrawAmount){
        revert InsufficientFunds("Not enough balance", cashAvailable);
    }

    cashAvailable -= _withDrawAmount;
}

function atmRefill(uint RefillAmount) public {
cashAvailable += RefillAmount;

}

}