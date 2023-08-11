// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract enums {
    
        enum  weekdays{
            none,
            monday,
            tuesday, 
            wednesday,
            thursday,
            friday
         }

         mapping(address => weekdays) officers;


    // function set(address addr, weekdays day) public  {
    //     officers[addr] = day;
    // }
    // function get(address addr) public view returns (weekdays){
    // return officers[addr];
    // }

    struct abc{
        string name;
        uint age;
        weekdays week;
        uint[] array;
    }

    mapping(address addr => abc) public detail;

    function setter(address addr, string memory _name, uint _age, weekdays _week) public  {
        detail[addr].name =  _name;
        detail[addr].age =  _age;
        detail[addr].week = _week;
       
    }
    function getter(address addr) public view returns (abc memory)  {
        return detail[addr];
    }
    function pushElement(address addr, uint[] memory child) public {
        uint[] storage arr = detail[addr].array;
        for (uint i=0; i<child.length; i++) 
        {
            arr.push(child[i]);
        }
    }
    function popElement(address addr) public  {
        // uint[] storage arr = detail[addr].array;
        detail[addr].array.pop();
    }
    
}
