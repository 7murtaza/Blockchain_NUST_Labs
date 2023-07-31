// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract EncapFuncCalls {
    function someFuncWithManyInputs(
        uint256 x,
        uint256 y,
        uint256 z,
        address a,
        bool b,
        string memory c
    )
        public
        pure
        returns (
            uint256 _x,
            uint256 _y,
            uint256 _z,
            address _a,
            bool _b,
            string memory _c
        )
    {
        _x = x;
        _y = y;
        _z = z;
        _a = a;
        _b = b;
        _c = c;
    }

    function callFunc()
        external
        pure
        returns (
            uint256 _x,
            uint256 _y,
            uint256 _z,
            address _a,
            bool _b,
            string memory _c
        )
    {
        return
            someFuncWithManyInputs(
                1,
                2,
                3,
                address(0),
                true,
                "Simple Function Call"
            );
    }

    function callFuncWithKeyValue() external pure returns (
            uint256 _x,
            uint256 _y,
            uint256 _z,
            address _a,
            bool _b,
            string memory _c
        )
    {
        return
            someFuncWithManyInputs({
                a: address(0),
                b: true,
                c: "Function Call with Key Value",
                x: 1,
                y: 2,
                z: 3
            });
    }
}
