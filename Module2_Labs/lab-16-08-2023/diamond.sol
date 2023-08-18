// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
/* Inheritance tree：
 Car
 / \
TOYOTA BMW
 \ /
 Supra
*/
contract Car {
 event Log(string message);
 function demo() public virtual {
 emit Log("Base Car demo Called");
 }
 function temp() public virtual {
 emit Log("Base Car temp Called");
 }
}
contract TOYOTA is Car {
 function demo() public virtual override {
 emit Log("TOYOTA demo called");
 }
 function temp() public virtual override {
 emit Log("TOYOTA temp called");
 super.temp();
 }
}
contract BMW is Car {
 function demo() public virtual override {
 emit Log("BMW demo called");
 }
 function temp() public virtual override {
 emit Log("BMW temp called");
 super.temp();
 }
}
contract Supra is TOYOTA, BMW {
 function demo() public override(TOYOTA, BMW) {
 super.demo();
 }
 function temp() public override(TOYOTA, BMW) {
 super.temp();
 }
}