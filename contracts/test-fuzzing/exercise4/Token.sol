// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

/**
 * @notice test transfer function by using assertions:
 * 1. msg.sender must have its initial balance or less.
 * 2. to must have its initial balance or more.
 * @notice also there are two ways to run this contract
 * @dev the first way to run: $ echidna-test Token.sol --test-mode assertion --contract Token
 * @dev the second way to run: $ echidna-test Token.sol --config config.yaml --contract Token
 */

contract Ownership {
    address owner = msg.sender;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(owner == msg.sender);
        _;
    }
}

contract Pausable is Ownership {
    bool is_paused;

    modifier ifNotPaused() {
        require(!is_paused);
        _;
    }

    function paused() public isOwner {
        is_paused = true;
    }

    function resume() public isOwner {
        is_paused = false;
    }
}

contract Token is Pausable {
    mapping(address => uint256) public balances;

    function transfer(address to, uint256 value) public ifNotPaused {
        require(balances[msg.sender] >= value && value > 0);
        require(to != address(0x0));

        uint256 init_balance_from = balances[msg.sender];
        uint256 init_balance_to = balances[to];

        balances[msg.sender] -= value;
        balances[to] += value;

        assert(balances[msg.sender] < init_balance_from);
        assert(balances[to] > init_balance_to);
    }
}
