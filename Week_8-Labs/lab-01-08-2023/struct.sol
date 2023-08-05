// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
struct Voter {
    string Name;
    address addr;
    bool hasVoted;
}

contract VotingSystem {
    // An array of 'Voter' structs
    Voter[] public voters;

    function create1(string memory _Name, address _addr) public {
        voters.push(Voter(_Name, _addr, false));
    }

    function create2(string memory _Name, address _addr) public {
        voters.push(Voter({Name: _Name, addr: _addr, hasVoted: false}));
    }

    function create3(string memory _Name, address _addr) public {
        Voter memory voter;
        voter.Name = _Name;
        voter.addr = _addr;
        // Voter.hasVoted initialized to false
        voters.push(voter);
    }

    function get(uint256 _index) public view returns (
            string memory Name,
            address addr,
            bool hasVoted
        )
    {
        Voter storage voter = voters[_index];
        return (voter.Name, voter.addr, voter.hasVoted);
    }

    // update hasVoted
    function togglehasVoted(uint256 _index) public {
        Voter storage voter = voters[_index];
        voter.hasVoted = !voter.hasVoted;
    }
}
