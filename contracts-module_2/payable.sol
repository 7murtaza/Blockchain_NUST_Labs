// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;
// || Normal wallet             || Contract address                                   || DATA        || Recieve                                                    || return
// =================================================================================================================================================================================================
// || Transfer : Yes            || No  - recommended-contract to wallet, value send     || No          || recieve() if not found function then goes to fallback()    || No return, 2300 gas
// || Send     : Yes            || No  - recommended-contract to wallet - if no data, value send           || No          || recieve() if not found function then goes to fallback()    || bool returns, 2300 gas
// || Call     : No             || Yes - high recommended contract to contract, value + data send          || Yes         || recieve() if not found function then goes to fallback()    || bool returns, No limit gas
//==================================================================================================================================================================================================
contract pay {
    function b() public payable {
    
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }
}