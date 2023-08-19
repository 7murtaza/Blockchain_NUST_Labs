// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Base {
    uint256 data;

    event log(string, uint);
    constructor(uint256 _data) {
        data = _data;
    }
    function Print() public virtual returns (string memory) {
        emit log("base", data);
        return "Base Initialized";
    }
}

contract Derived is Base(3) {
    event log2(string, uint);
    constructor() {}

    function getData() external view returns (uint256) {
        uint256 result = data**2;
        return result;
    }

    function Print() public virtual override returns (string memory) {
        emit log2("direct initialization of data variable from base contract and calculated result", data);
        return "Direct Initialization";
    }
}

contract Derived2 is Base {
    event log3(string, uint);
    constructor(uint256 _temp) Base(_temp) {}

    function getData() external view returns (uint256) {
        uint256 result = data**4;
        return result;
    }

    function Print() public virtual override returns (string memory) {
         emit log3("indirect initialization of data variable from base contract and calculated result", data);
        return "Indirect Initialization";
    }
}

contract Caller {
    Derived c = new Derived();
event log4(string, uint);
    function getResult() public returns (uint256) {
        c.Print();
         emit log4("created an instance of contract Derived", c.getData());
        return c.getData();
    }
}
