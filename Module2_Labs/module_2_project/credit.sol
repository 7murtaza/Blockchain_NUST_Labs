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
    State public state;

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

function invest() public payable canInvest{
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
        lendersInvestedAmount[msg.sender] = lendersInvestedAmount[msg.sender].add(msg.value.sub(extraMoney));
        emit LogLenderInvestment(msg.sender, msg.value.sub(extraMoney), block.timestamp);
    }
    

function repay() public payable onlyBorrower canRepay{
        require(remainingRepayments > 0);
        require(msg.value >= repaymentInstallment);
        assert(repaidAmount < returnAmount);
        remainingRepayments--;
        lastRepaymentDate = block.timestamp;
        
        uint extraMoney = 0;
        if(msg.value > repaymentInstallment){
         extraMoney = msg.value.sub(repaymentInstallment);
        assert(repaymentInstallment == msg.value.sub(extraMoney));
        assert(extraMoney <= msg.value);
        payable(msg.sender).transfer(extraMoney);
        emit LogBorrowerChangeReturned(msg.sender, extraMoney, block.timestamp);
        }
        emit LogBorrowerRepaymentInstallment(msg.sender, msg.value.sub(extraMoney), block.timestamp);
        repaidAmount = repaidAmount.add(msg.value.sub(extraMoney));

        if(repaidAmount == returnAmount){
            emit LogBorrowerRepaymentFinished(msg.sender, block.timestamp);
            state = State.interestReturns;
            emit LogCreditStateChanged(state, block.timestamp);
        }
    }
    
function Withdraw() public payable onlyBorrower isActive canWithdraw{
    state = State.repayment;
    emit LogCreditStateChanged(state, block.timestamp);
    emit LogBorrowerWithdrawal(msg.sender, address(this).balance, block.timestamp);
    
    payable(msg.sender).transfer(address(this).balance);
    
    }

function requestInterest() public payable onlyLender canAskForInterest isActive{

    uint lenderReturnAmount = lendersInvestedAmount[msg.sender].mul(returnAmount.div(lendersCount).div(lendersInvestedAmount[msg.sender]));
    assert(address(this).balance >= lenderReturnAmount);
    payable(msg.sender).transfer(lenderReturnAmount);
    emit LogLenderWithdrawal(msg.sender, lenderReturnAmount, block.timestamp);

    if(address(this).balance == 0){
        active = false;
        emit LogCreditStateActiveChanged(active, block.timestamp);
        state = State.expired;
        emit LogCreditStateChanged(state, block.timestamp);

    }
    }

function getCreditInfo() public view returns (address, bytes memory, uint, uint, uint, uint, uint, uint, State, bool, uint){

        return (borrower, description, requestedAmount, requestedRepayments, repaymentInstallment, remainingRepayments, interest,
    returnAmount, state, active, address(this).balance);
    }

function revokeVote() public onlyLender isActive isRevokable{
        require(revokeVoters[msg.sender] == false);
        require(block.timestamp >= revokeTimeNeeded);
        revokeVotes++;
        revokeVoters[msg.sender] = true;
        emit LogLenderVoteForRevoking(msg.sender, block.timestamp);
        if(revokeVotes == lendersCount){
            revoke();
        }
    }

function revoke() internal {
        state = State.revoked;
        emit LogCreditStateChanged(state, block.timestamp);
    }


function refund() public onlyLender isRevoked isActive{
    require(address(this).balance >= lendersInvestedAmount[msg.sender]);
        payable(msg.sender).transfer(lendersInvestedAmount[msg.sender]);
        emit LogLenderRefunded(msg.sender, lendersInvestedAmount[msg.sender], block.timestamp);
        if(address(this).balance == 0){
            active = false;
            emit LogCreditStateActiveChanged(active, block.timestamp);
            state = State.expired;
            emit LogCreditStateChanged(state, block.timestamp);
        }
    }


function fraudVote() public onlyLender isActive {
    require(fraudVoters[msg.sender] == false);
    fraudVotes++;
    fraudVoters[msg.sender] = true;
    emit LogLenderVoteForFraud(msg.sender, block.timestamp);
}

}
