// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract PizzaDeli {
 
    enum pizzaOrder{
        Pending,
        Preparing,
        Delivering,
        Recieved
    }

    /* In your contract PizzaDeli, make three variables named P1, P2 and P3 respectively
for your PizzaOrder enum where:
a) P1 will be assigned no value.
b) P2 will be assigned Preparing status using method 1 in section 1.7.
c) P3 will be assigned Received status using method 2 in section 1.7 */

    pizzaOrder public P1;
    pizzaOrder public P2 = pizzaOrder.Preparing;
    pizzaOrder public P3 = pizzaOrder(3);
/*
In your contract PizzaDeli:
a) Make a setter function for P1 variable.
b) Using what you have learned in the previous Lab about Functions, make a
single getter function that returns values of all three variables P1, P2 and P3. */
    function setter(pizzaOrder _s) public {
        P1 = _s;
    }

    function getter() public view returns(pizzaOrder, pizzaOrder,pizzaOrder ) {
    return (P1, P2, P3);
    }
}