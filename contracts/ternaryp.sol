// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract ternary{
    uint public constant cut_off_age = 10;
    uint public constant old_age_off_age = 70;
    uint public constant child_fee = 0;
    uint public constant adult_fee = 20;
    uint public constant old_age_fee = 30;
    

    // function ter(uint u2) public pure returns (string memory) {
    //     return u2< 256 ? "value can be stored in uint8 " : "value cannot be stored in uint8 and uint16 ";
    // }

    // function ter2(uint age, bool isGirl) public pure returns (uint, string memory){
    //     string memory gift = "";
    //     return (age < cut_off_age) ? (child_fee, (isGirl) ? "barbie doll" : "toy gun") : (adult_fee, gift);
    // }
    // function ter3(uint u2) public pure returns (string memory){
    //     if (u2 < 256){
    //         string memory a = "value can be stored in uint8";
    //     return a;
    //     }else if(u2 < 65536){
    //          string memory a= "value can be stored in uint16";
    //     return a;

    //     }
    //     else{
    //          string memory a= "value cannot be stored in uint8 or uint16";
    //     return a;
    //     }
    // }
    function ter2(uint age, bool isGirl) public pure returns (uint, string memory){
        string memory gift = "";
        // string memory gift1 = "barbie doll";
        // string memory gift2 = "toy gun";
        // string memory gift3 = "$50 food voucher";
        return (age < cut_off_age) ? (child_fee, (isGirl) ? "barbie doll" : "toy gun") : (age > old_age_off_age) ? (old_age_fee, gift): (adult_fee, gift);
        // return (age < cut_off_age) ? (child_fee, (isGirl) ? gift1 : gift2) : (age > old_age_off_age) ? (old_age_fee, gift3): (adult_fee, gift);
    }
}
 