// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// Design a Solidity contract named ‘Apartment’. Declare an internal variable ‘tenantcount’ of
// uint type to keep track of the number of tenants. Implement an external ‘joinApartment()’
// function that allows new tenants to join. Create a child contract ‘Tenant’, run the
// ‘joinApartment()’ function in the ‘Tenant’ contract. Attempt to make a ‘getter()’ function for
// ‘tenantcount’ in the ‘Tenant’ contract as well. Is it possible?

contract Apartment {
    uint internal tenantcount;

    function joinApartment(uint _join) external {
        tenantcount += _join;
    }
}

contract Tenant is Apartment {
    
    function getter() public view returns (uint) {
        return tenantcount;
    }

}