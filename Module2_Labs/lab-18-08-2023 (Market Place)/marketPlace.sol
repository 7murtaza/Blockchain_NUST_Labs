// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//creating marketplace contract
contract marketPlace{

    mapping (address => uint) public balance;

    event purchase(address _buyer, address _sender, uint _value);

    function register(address _addr, uint _initialBalance) public {
        require(_initialBalance >0, "Amount should be greater than 0");
        balance[_addr] = _initialBalance;
    }

    function buy(address _buyer, address _seller, uint _cash) public payable virtual {
       require(balance[_buyer] !=0 && balance[_seller] != 0, "buyer or seller is not registered");
       require(_cash>0, "Cash must be greater than zero");

        balance[_buyer] -= _cash;
        balance[_seller] += _cash;

        emit purchase(_buyer, _seller, _cash);
    }


// 1. Base Marketplace Contract:
//  Create a base contract named `Marketplace`.
//  Implement a `mapping` named ‘balance’ that maps address to uint, to store the
// balance of each participant's address.
//  Define an `event` named `Purchase` to log details of a purchase. e.g. ‘buyer address’,
// ‘sender address’, and ‘value of purchase’.
//  Write a function `register` to register address of a new participant with an initial balance.
//     o Send a relevant ‘error’ message if ‘initial balance’ is inputted as zero.
//  Implement the `buy` function to enable a ‘registered’ buyer to purchase an item from a
// ‘registered’ seller. It will also send ‘cash’ taken as input in the function, from buyer
// address to seller address.
// o Send a relevant ‘error’ message if either ‘buyer’ or ‘seller’ have not been
// previously registered.
// o Send a relevant ‘error’ message if ‘cash’ inputted is zero.
// o Make sure to deduct the ‘cash’ from the ‘buyer’s balance’ and add it to the
// ‘sender’s balance’.
// o At the end of the function, emit the ‘sender’ address, ‘buyer’ address and the
// ‘cash’ taken as input.
//  Develop the `sell` function for a ‘registered’ seller to transfer an item (item cannot be
// free) to a ‘registered’ buyer.
// o For transferring item, you can just return a string statement saying that “Item will
// be shipped to buyer’s location”.
// o Send a relevant ‘error’ message if either ‘buyer’ or ‘seller’ have not been
// previously registered.
// o Send a relevant ‘error’ message if price of the item being sold is inputted as zero.
// o Send a relevant ‘error’ message if the ‘sender’ and the ‘buyer’ are the same
// person.

function sell(address _seller, address _buyer, uint _itemPrice) public payable virtual returns(string memory _transferedItem){
    require(balance[_seller] != 0 || balance[_buyer] !=0, "buyer or seller is not registered");
    require(_itemPrice>0 || _itemPrice == balance[_buyer], "itemPrice must be greater than zero or should match the cash of itemPrice");
    require(balance[_seller] != balance[_buyer], "seller and buyer cannot be same person");
    _transferedItem = "item will be shipped to buyer's location";
    return _transferedItem;
    }

}

// 2. PremiumSeller Contract:
//  Create a derived contract named `PremiumSeller` that inherits from the `Marketplace`
// contract.
//  Add a state variable `fee` to store the fee percentage.
//  Write a constructor to set the `fee` when creating a `PremiumSeller` instance.
//  Override the `sell` function from the base contract to deduct the fee from the
// ‘registered’ seller's balance and add it to the contract's balance.
// o You can add to contract balance using address(this) for contract address.
// o Send an ‘error’ message if ‘balance’ of the seller is zero.
// o Include the rest of the ‘error’ statements mentioned in the ‘sell()’ function in the
// ‘Marketplace’ contract using super keyword.

contract premiumSeller is marketPlace {

    uint fee;

    constructor(uint _fee){
        fee = _fee;
    }

    function sell(address _seller, address _buyer, uint _itemPrice) public payable virtual override returns(string memory _transferedItem){
        balance[_seller] -= fee;
        uint feeAmount = _itemPrice * fee / 100;
        address(this).balance;
        require(balance[_seller] != 0, "seller balance is zero");
      return super.sell(_seller, _buyer, feeAmount);
    
    }
    
}
// 3. RegularBuyer Contract:
//  Create a derived contract named `RegularBuyer` inheriting from the `Marketplace`
// contract.
//  No additional features are required for `RegularBuyer`.

contract regularBuyer is marketPlace{

}

// 4. VIPBuyer Contract:
//  Develop a derived contract named `VIPBuyer` inheriting from the `Marketplace`
// contract.
//  Add a state variable `discount` to store the discount percentage.
//  Write a constructor to set the `discount` when creating a `VIPBuyer` instance.
//  Override the `buy` function from the base contract to apply the discount to the purchase
// amount for VIP Buyers.
// o Send a relevant ‘error’ message if either ‘buyer’ or ‘sender’ addresses are not
// registered.
// o Make sure to subtract the ‘discounted’ price from the ‘buyer’s address’ and add it
// to the ‘seller’s address’.
// o At the end of the function, emit the ‘sender’ address, ‘buyer’ address and the
// ‘discounted’ price paid.
contract vipBuyer is marketPlace{
    uint discount;
    constructor(uint _discount){
        discount = _discount;
    }
    
    function buy(address _buyer, address _seller, uint _cash) public payable  virtual override {
       require(balance[_buyer] !=0 || balance[_seller] != 0, "buyer or seller is not registered");
       require(_cash>0, "Cash must be greater than zero");
       require(balance[_seller] != balance[_buyer], "seller and buyer cannot be same person");
        uint discountAmount = _cash * discount / 100;
        uint finalAmount = _cash - discountAmount;

        balance[_buyer] -= finalAmount;
        balance[_seller] += finalAmount;

        emit purchase(_buyer, _seller, finalAmount);
    }

}