// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract encodeSelector {
    function encodeWithSelector(address _address, uint256 data)
        public
        pure
        returns (bytes memory result)
    {
        result = abi.encodeWithSelector(
            bytes4(keccak256("encodeWithSelector(address, uint )")),
            _address,
            data
        );
    }
    
}

contract encodeSignature {
    function encodeWithSignature(address _address, uint256 data)
        public
        pure
        returns (bytes memory result)
    {
        result = abi.encodeWithSignature(
            ("encodeWithSelector(address, uint )"),
            _address,
            data
        );
    }
}
//0x29207c89000000000000000000000000d9145cce52d386f254917e481eb44e9943f391380000000000000000000000000000000000000000000000000000000000000001
//0x29207c89000000000000000000000000d9145cce52d386f254917e481eb44e9943f391380000000000000000000000000000000000000000000000000000000000000001