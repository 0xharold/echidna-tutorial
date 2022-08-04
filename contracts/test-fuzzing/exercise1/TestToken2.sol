// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "./Token.sol";

/// @dev to run: $ echidna-test TestToken.sol
/// @notice do not forget to be in the correct folder

contract TestToken2 is Token {
    address echidna_caller = msg.sender;

    constructor() {
        paused(); // pause the contract
        owner = address(0x0); // lose ownership
    }

    // test property
    function echidna_cannot_be_unpaused() public view returns (bool) {
        return is_paused == true;
    }
}
