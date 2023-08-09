// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

struct BankAccount {
    uint256 accountID;
    uint256 balance;
    address owner;
}

contract Bank {
    BankAccount[] public account;
    BankAccount public secondAccount;
    // Creating a storage struct reference within a function:
    function method1(uint256 id, uint256 bal, address addr) public pure {
        BankAccount memory _account;
        _account.accountID = id;
        _account.balance = bal;
        _account.owner = addr;
    }
    // Creating a storage struct reference within a function:
    function method11() public {
      BankAccount storage _account2 = secondAccount;
        _account2.accountID = 1;
        _account2.balance = 10;
        _account2.owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
}
    // Directly referring to the struct of a state variable:
    // function method2(uint256 id, uint256 bal, address addr) public {
    //     account.push(BankAccount(id, bal, addr));
       
    // }
    // 2.Directly referring to the struct of a state variable:
    function method2() public {
        
       secondAccount.accountID = 2;
       secondAccount.balance = 20;
       secondAccount.owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    }

    // Using a struct constructor:
    function method3(uint256 id, uint256 bal, address addr) public {
        account.push(BankAccount(id, bal, addr));
    }

    //3. Using a struct constructor:
    function method33() public {
        secondAccount = BankAccount(3, 90,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    }
    // Assigning values using key-value pairs:
    function method4(uint256 id, uint256 bal, address addr) public {
        account.push(BankAccount({accountID: id, balance: bal, owner: addr}));
    }
    //4 Assigning values using key-value pairs:
    function method44() public {
        secondAccount = BankAccount({accountID: 4, balance: 60, owner: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4});
    }

    function getFromArray(uint256 _index) public view returns (uint id, uint bal, address addr){
        BankAccount storage _account = account[_index];
        return (_account.accountID, _account.balance, _account.owner);
    }
    function get() public view returns (uint id, uint bal, address addr){
        return (secondAccount.accountID, secondAccount.balance, secondAccount.owner);
    }
}
