//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Mappings {
    mapping(address => mapping(string => mapping(string => uint))) public AddrWalletToName;

    function AddValue(address _addr, string memory _walletname, string memory _name, uint _balance) public {
        AddrWalletToName[_addr][_walletname][_name] = _balance;
    }

    function get(address _addr, string memory _walletname, string memory _name)public view returns (uint)
    {
        return AddrWalletToName[_addr][_walletname][_name];
    }

    function remove(address _addr, string memory _walletname, string memory _name) public {
        delete AddrWalletToName[_addr][_walletname][_name];
    }
    struct Student{
uint256 id;
uint256 score;
}

Student student; // Declaration or a sudemt variable or type student
Student _student = student;
_student.id = 11;
_student.score = 

}
