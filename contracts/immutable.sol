// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract immutables{

    address public ADMIN_Address = 0xCc4086F81C7d5b64E75dd2413A1854a8E2003091;

    function getAdminAddress() public view returns (address){
        return ADMIN_Address;
    }

}
