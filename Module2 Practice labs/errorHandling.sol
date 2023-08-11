// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Name {

    int public i;

    function set(int _i)public  {
        i = _i;
    }

    function int_to_uint(uint) public view returns (uint){
      
        if(i>0){
        uint _u1 = uint(i);
        return  _u1;        
        }else{
          revert("sads");
        }
        

    }
    
       function Revert(uint amount) public pure {
    if(amount > 100){
        revert("some error");
    }
        // withdraw(amount);

        }
       function Require(uint amount) public pure {
    
        // require(amount <= 100, " some error");
        // // withdraw(amount);
        // }

        require(!(amount<100) , "some error");
        // withdraw(amount);
       }

}