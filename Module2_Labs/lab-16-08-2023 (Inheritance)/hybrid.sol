// TASK
// Develop Solidity contracts for ‘Participant’, ‘Supplier’, ‘Manufacturer’, and ‘Product’, where
// ‘Product’ inherits from ‘Supplier’ and ‘Manufacturer’.
// Incorporate necessary state variables in each contract and some functions like ‘placeOrder’ in
// ‘Supplier’, ‘manufactureProduct’ in ‘Manufacturer’, and ‘trackProduct’ in ‘Product’.
// Deploy an instance of ‘Product’ inheriting features from all roles, and demonstrate invoking
// these combined actions for efficient supply chain management.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
contract Participant {
    string name;
    uint orderID;

    constructor(string  memory _name, uint _orderID){
        name = _name;
        orderID = _orderID;
    }
}
contract Supplier {

    function placeOrder() public pure returns (string memory) {
        return "order placed";
    }
}
contract Manufacturer {
    string productName;
    function manufactureProduct() public pure returns (string memory) {
        return "manufactured Product";
    } 
}
contract Product is Supplier, Manufacturer, Participant("murtaza", 123) {
    function trackProduct() public pure returns (string memory){
    return ("tracked product");
    }
}

contract caller{

    Product p = new Product();

    function print() public view returns (string memory, string memory, string memory) {
        return (p.placeOrder(), p.manufactureProduct(), p.trackProduct());
    }
}