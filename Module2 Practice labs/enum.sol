// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract enums {
    enum Role {
        teacher,
        student 
    }

    Role public role;
    Role public role2;

    function setTeacher() public {
        role = Role.student;
    }
}
