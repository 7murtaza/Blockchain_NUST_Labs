// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract PersonInformation {
    
// 1) Create a struct named ‘PersonInfo’, having multiple elements giving information
// about a person. Also, make a variable named P1, for that struct.

struct PersonInfo{
    string name;
    uint age;
    string nationality;
}

PersonInfo public P1;

// 2) Make an event having parameters ‘OldValue’ of PersonInfo data type, NewValue
// of PersonInfo data type, ‘timestamp’ of uint data type and ‘number’ also of uint data
// type. Name the event as ‘Update’.

event Update(PersonInfo OldValue, PersonInfo NewInfo, uint timestamp, uint number);

// 3) Make a ‘setter’ function for your P1 variable. The ‘setter’ function should be such that
// it also emits the ‘old value’ of P1, the ‘new value’ of P1, ‘timestamp’ of the block to show
// when it is emitted and ‘number’ of the block to show in which block number it is emitted.

function setter()public {
PersonInfo memory NewValue = P1;
NewValue.name = "Murtaza";
NewValue.age = 22;
NewValue.nationality = "Pakistani";

emit Update(P1, NewValue, block.timestamp, block.number);


}

}