// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


contract votingData {
    
//     1) Use ABI encoding techniques to serialize the voting data that takes address, ID,
// name and date of birth (unit[3]) into a byte array
// 2) Use ABI decoding techniques to extract the voter ID details from the encoded byte
// array.
// 3) Verify the accuracy of the decoded data by comparing it with the original voting data.


    function encode(address _addr, uint _ID, string memory _name, uint[3] memory _dob) public pure returns (bytes memory) {
        return abi.encode(_addr, _ID, _name, _dob);
    }
    function decode(bytes memory _data) public pure returns (address _addr, uint _ID, string memory _name, uint[3] memory _dob) {
        (_addr, _ID, _name, _dob) = abi.decode(_data, (address, uint, string, uint[3]));
    }

    //0xD4Fc541236927E2EAf8F27606bD7309C1Fc2cbee

}