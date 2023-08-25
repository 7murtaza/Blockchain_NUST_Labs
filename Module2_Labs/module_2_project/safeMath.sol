// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library safeMath {
    
    function mul(uint _num1, uint _num2) internal pure returns(uint){
        uint num3 = _num1 * _num2;
        assert(num3 / _num1 == _num2);
        return num3;
    }

    function div(uint _num1, uint _num2) internal pure returns(uint) {
        if(_num1 == 0)
        return 0;
        assert(_num2 != 0);
        uint num3 = _num1/_num2;
        return num3;
    }

    function sub(uint _num1, uint _num2) internal pure returns(uint){
        uint num3 = _num1 - _num2;

        assert(_num2 < _num1);
        return num3;

    }

    function add(uint _num1, uint _num2) internal pure returns(uint){
        uint num3 = _num1 + _num2;
        assert(num3 >= _num1);
        return num3;
    }


}