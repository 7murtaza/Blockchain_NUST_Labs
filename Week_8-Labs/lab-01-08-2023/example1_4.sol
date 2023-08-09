//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Enum {
    Exam public e1 = Exam(0);
    // Exam public e1 = Exam.Scholarship;
    enum Exam {
        Checking,
        Pass,
        Fail,
        Scholarship
    }

    Exam public e3 = Exam(3);

    // What do you think will be the uint value returned by e3 in this case?
    // it will return 3, as it is refering to scholarship

    /*
a) Observe and Run the example given in section 1.4 and 1.5.
b) Using the example given in section 1.10 as a guide, make a function named
Fail that updates the state of ‘e1’ to Fail, only if ‘e1’ is in the Checking state.
c) Make a function named Scholarship, that updates the state of ‘e1’ to
Scholarship only if the previous state of e1 is ‘Pass’.
d) Make a function named idelete that resets the state of e1 to its default value.
(See section 1.9)
*/

    function Fail() public {
        if (e1 == Exam.Checking)
        e1 = Exam.Fail;
    
    }

    function Scholarship() public {
        if (e1 == Exam.Pass)
        e1 = Exam.Scholarship;
    }

    function idelete() public {
        delete e1;
    }

}
