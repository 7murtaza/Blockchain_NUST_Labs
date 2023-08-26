// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "Module2_Labs/module_2_project/safeMath.sol";
import "Module2_Labs/module_2_project/ownable.sol";

contract credit is ownable {
    using safeMath for uint;

    address borrower;
    uint requestedAmount;
    uint returnAmount;
    uint repaidAmount;
    uint interest;
    uint requestedRepayments;
    uint remainingRepayments;
    uint repaymentInstallment;
    uint requestDate;
    uint lastRepaymentDate;
    bytes description;
    bool active = true;
    uint lendersCount = 0;
    uint revokeVotes = 0;
    uint revokeTimeNeeded = block.timestamp + 1 seconds;
    uint fraudVotes = 0;
    mapping (address=>bool) public lenders;
    mapping (address=> uint) public lendersInvestedAmount;
    mapping (address => bool) public revokeVoters;
    mapping (address=> bool) public fraudVoters;

    enum State {
        investment,
        repayment,
        interestReturns,
        expired,
        revoked,
        fraud
    }
    State  public state;

    event LogCreditInitialized(address indexed _address, uint indexed _timestamp);
    event LogCreditStateChanged(State indexed state, uint indexed timestamp);
    event LogCreditStateActiveChanged(bool indexed active, uint indexed timestamp);
    event LogBorrowerWithdrawal(address indexed _address, uint indexed _amount, uint indexed timestamp);
    event LogBorrowerRepaymentInstallment(address indexed _address, uint indexed _amount, uint indexed timestamp );
    event LogBorrowerRepaymentFinished(address indexed _address, uint indexed timestamp);
    event LogBorrowerChangeReturned(address indexed _address, uint indexed _amount, uint indexed timestamp );
    event LogLenderInvestment(address indexed _address, uint indexed _amount, uint indexed timestamp );
    event LogLenderWithdrawal(address indexed _address, uint indexed _amount, uint indexed timestamp );
    event LogLenderChangeReturned(address indexed _address, uint indexed _amount, uint indexed timestamp );
    event LogLenderVoteForRevoking(address indexed _address, uint indexed timestamp );
    event LogLenderVoteForFraud(address indexed _address, uint indexed timestamp );
    event LogLenderRefunded(address indexed _address, uint indexed _amount, uint indexed timestamp );

    modifier isActive{
        require(active == true);
        _;
    }
    modifier onlyBorrower{
        require(msg.sender == borrower);
        _;
    }
    modifier onlyLender{
        require(lenders[msg.sender] == true);
        _;
    }
    
    // canAskForInterest: Allows lenders to request interest returns
    modifier canAskForInterest{
        require(state == State.interestReturns);
        require(lendersInvestedAmount[msg.sender] >0);
    _;
    }

    // canInvest:
    modifier canInvest{
        require(state == State.investment);
        _;
    }
    // canRepay:Allows the borrower to make repayment installments.
    modifier canRepay{
        require(state == State.repayment);
        _;
    }
    // canWithdraw: Ensures enough balance to allow withdrawal by the borrower

    modifier canWithdraw{
        require(address(this).balance >requestedAmount);
        _;
    }

    // isNotFraud: Ensures the credit is not marked as fraud

    modifier isNotFraud{
        require(state != State.fraud);
        _;
    }
    // isRevokable: Ensures the credit is in the "investment" state and can be revoked.
    modifier isRevokable{
        require(block.timestamp >= revokeTimeNeeded);
        require(state == State.investment);
        _;
    }


    // isRevoked: Ensures the credit is in the "revoked" state.
    modifier isRevoked{
        require(state == State.revoked);
        _;
    }
    constructor(uint _requestedAmount, uint _requestedRepayments, uint _interest, bytes memory _description){
        borrower = tx.origin;
        requestedAmount = _requestedAmount;
        requestedRepayments =  _requestedRepayments;
        interest = _interest;
        description = _description;
        returnAmount = requestedAmount.add(interest);
        repaymentInstallment = returnAmount.div(requestedRepayments);
        requestDate = block.timestamp;

        emit LogCreditInitialized(borrower, block.timestamp);

    }

    function getBalance() external view returns (uint){
        return address(this).balance;
    } 

    function changeState(State _state) external onlyOwner {
      state = _state;
      emit LogCreditStateChanged(state, block.timestamp);
    }

    function toggleActive() external onlyOwner returns (bool) {
        active = !active;
        emit LogCreditStateActiveChanged(active, block.timestamp);
        return active;
    }

    function invest() external payable canInvest{
        uint extraMoney = 0;
        if(address(this).balance >= requestedAmount){
            extraMoney = address(this).balance.sub(requestedAmount);
            assert(requestedAmount != address(this).balance.sub(extraMoney));
            assert(extraMoney<= msg.value);
            
            if (extraMoney >0){
                payable(msg.sender).transfer(extraMoney);
                emit LogLenderChangeReturned(msg.sender, extraMoney, block.timestamp);
            }
            state == State.repayment;
            emit LogCreditStateChanged(state, block.timestamp);
        }
        lenders[msg.sender] = true;
        lendersCount++;
        lendersInvestedAmount[msg.sender] = lendersInvestedAmount[msg.sender].add(extraMoney);
        emit LogLenderInvestment(msg.sender, msg.value.sub(extraMoney), block.timestamp);
    }
    


}