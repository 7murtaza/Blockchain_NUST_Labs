// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Name {
    function encode(address _address, uint256 data)
        public
        pure
        returns (bytes memory)
    {
        return (abi.encode(_address, data));
    }

    function decode(bytes memory data)
        public
        pure
        returns (address daddr, uint256 dnum)
    {
        (daddr, dnum) = abi.decode(data, (address, uint256));
    }
}
//0xcD6a42782d230D7c13A74ddec5dD140e55499Df9