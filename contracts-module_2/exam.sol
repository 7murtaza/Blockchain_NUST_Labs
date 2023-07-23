// Create a Solidity function that takes an integer parameter representing a student's score
// in an exam, and returns (bool, string).
// ● If the score is greater than or equal to 60, return "True."
// ➔ If score is between 80-100, return “Achieved Gade : A”
// ➔ If score is between 60-79, return “Achieved Gade : B”
// ● If the score is less than 60, return "False."
// ➔ If score is between 40-59, return “Achieved Gade : C”
// ➔ For remaining 0-39, return “Better Luck Next Time”.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract  IntegerCheckerTernary{

    function grade(uint score) public pure returns(bool, string memory){
    //  if(score >= 80 && score <= 100){
    //         return (true, "Achieved Gade : A");
    //     } else if (score >= 60 && score < 80){
    //         return (true, "Achieved Gade : B");
    //     } else if (score >=40 && score < 60){
    //         return (false, "Achieved Gade : C");
    //     }
    //     else{
    //         return (false,"Better Luck Next Time" );
    //     }

    return score >= 80 && score <= 100 ? (true, "Achieved Gade : A") : (score >= 60 && score < 80) ? (true, "Achieved Gade : B") : (score >=40 && score < 60) ? (false, "Achieved Gade : C"):(false,"Better Luck Next Time" ) ;

    }
}

