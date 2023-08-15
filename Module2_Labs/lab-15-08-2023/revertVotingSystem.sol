// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;


contract votingSystem{
    
// TASK
// Design a Solidity contract called ‘VotingSystem’. Implement a function vote(uint256
// _candidateId) that allows users to vote for a candidate.
// Use a ‘revert’ statement to handle the case when the user has already voted or when the
// _candidateId is invalid.

// bool hasVoted;


mapping(uint => bool) public voterStatus;

function voted(uint _candidateID, bool _hasVoted)public {

voterStatus[_candidateID] = _hasVoted;
    
}

function vote(uint _candidateID) public view {

    if(voterStatus[_candidateID] == true || ( _candidateID <0 || _candidateID >100 )){
        revert("Candidate has already voted or invalid Candidate ID");
    }

    voterStatus[_candidateID] == true;


    }



}