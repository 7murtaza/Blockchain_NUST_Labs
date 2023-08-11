// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract  counter{
    uint public count;
    function increment() external  {
        count += 1;
    }
}

interface Icounter {
    function increment() external;
    function count() external view returns (uint);
}

contract myCounter {
    function myIncrement(address addr) public  {
        Icounter(addr).increment();
    }
    function myCount(address addr) public view returns(uint) {
        return Icounter(addr).count();
    }
}