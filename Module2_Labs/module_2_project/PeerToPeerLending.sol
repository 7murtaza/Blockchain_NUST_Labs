// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "Module2_Labs/module_2_project/credit.sol";
import "Module2_Labs/module_2_project/safeMath.sol";

contract PeerToPeerLending is ownable{
    using safeMath for uint;
    struct User{
        bool credited;
        address activeCredit;
        bool fraudulent;
        address[] allCredits;
    }

    mapping (address => User) public user;
    address[] credits;

    event LogCreditCreated(address indexed _address, address indexed borrower, uint timestamp);
    event LogCreditStateChanged(address indexed _address, credit.State indexed state, uint timestamp);
    event LogCreditActiveChanged(address indexed _address, bool active, uint timestamp);
    event LogUserSetFraud(address indexed _address, bool fraudStatus, uint timestamp);

    function applyForCredit(uint _requestedAmount, uint _repayment, uint _interest, bytes memory _description) public returns(address) {
        require(user[msg.sender].credited == false);
        require(user[msg.sender].fraudulent == false);
        require(user[msg.sender].activeCredit == address(0));

        user[msg.sender].credited = true;
        credit Credit = new credit(_requestedAmount, _repayment, _interest, _description);
        user[msg.sender].activeCredit = address(Credit);

        credits.push(address(Credit));

        user[msg.sender].allCredits.push(address(Credit));

        emit LogCreditCreated(address(Credit), msg.sender, block.timestamp);

        return address(Credit);
    }


    function getCredits() public view returns(address[] memory){
        return credits;
    }

    function getUserCredits() public view returns(address[] memory){

        return user[msg.sender].allCredits;
    }

    function setFraudStatus(address _address) public returns (bool) {
        bool fraudStatus = user[_address].fraudulent = true;
        emit LogUserSetFraud(_address, fraudStatus, block.timestamp);
        return fraudStatus;
    }

    function changeCreditState(credit _Credit, credit.State _state) public onlyOwner{

        credit Credit = credit(_Credit);
        Credit.changeState(_state);
        emit LogCreditStateChanged(address(Credit), _state, block.timestamp);

    }

    function changeCreditState(credit _Credit) public onlyOwner returns(bool){
        credit Credit = credit(_Credit);
        bool updatedActiveState = Credit.toggleActive();
        emit LogCreditActiveChanged(address(Credit), updatedActiveState, block.timestamp);
        return updatedActiveState;
    }


}