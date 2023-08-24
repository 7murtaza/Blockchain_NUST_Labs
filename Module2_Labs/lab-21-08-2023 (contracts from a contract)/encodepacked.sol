// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract encodePackedd {
    function encodePacked(address _address, uint data) public pure
    returns(bytes memory result) {
    result = abi.encodePacked(_address, data);
 }

 function encode(address _address, uint data)
 public pure returns (bytes memory) {
 return (abi.encode(_address, data));
}
}
//0x000000000000000000000000d8b934580fce35a11b58c6d73adee468a2833fa8000000000000000000000000000000000000000000000000000000000000007b
//0xd8b934580fce35a11b58c6d73adee468a2833fa8000000000000000000000000000000000000000000000000000000000000007b