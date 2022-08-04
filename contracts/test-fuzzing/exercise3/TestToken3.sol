// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;
import "./Mintable.sol";

contract TestToken3 is Mintable {
    address echidna_caller = msg.sender;

    constructor() {
        owner = echidna_caller;
        totalMintable = 1000;
    }

    function echidna_test_can_mint_more_than_1000() public view returns (bool) {
        return balances[echidna_caller] <= 1000;
    }
}
