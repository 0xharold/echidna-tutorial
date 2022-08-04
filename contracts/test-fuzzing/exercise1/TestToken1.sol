// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "./Token.sol";

/// @dev to run: $ echidna-test TestToken.sol
/// @notice do not forget to be in the correct folder

contract TestToken1 is Token {
    address echidna_caller = msg.sender;

    constructor() {
        balances[echidna_caller] = 10000;
    }

    // test property
    function echidna_test_balance() public view returns (bool) {
        return balances[echidna_caller] <= 10000;
    }
}
