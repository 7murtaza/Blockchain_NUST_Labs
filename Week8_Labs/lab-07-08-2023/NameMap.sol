//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract NameMap {

// a) Make a contract named ‘NameMap’. In it, define a mapping, having keys 
// ‘YearOfBirth’ of uint type, ‘WalletAddress’ of address type, and ‘Codename’ of 
// string type. The mapping should give a value named ‘UserName’ of string type. 
// Name the mapping as ‘UserMap’.
// b) Create a setter function for the above mapping named ‘setMap

mapping(uint => mapping(address=>mapping(string => string))) public UserMap;


function setter(uint _YearOfBirth, address _WalletAddress, string memory _Codename, string memory _UserName) public {

    UserMap[_YearOfBirth][_WalletAddress][_Codename] = _UserName;
}

// c) Create a getter function for the above mapping named ‘getMap’.

function getter(uint _YearOfBirth, address _WalletAddress, string memory _Codename) public view returns (string memory _UserName){

    return UserMap[_YearOfBirth][_WalletAddress][_Codename];
}

function reset(uint _YearOfBirth, address _WalletAddress, string memory _Codename) public {
    delete UserMap[_YearOfBirth][_WalletAddress][_Codename];
}

}