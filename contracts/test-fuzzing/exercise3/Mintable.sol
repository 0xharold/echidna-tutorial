// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;
import "./Token.sol";

contract Mintable is Token {
    uint256 totalMinted;
    uint256 totalMintable;

    /// @notice echidna does not allow any parameter in the constructor
    /// thus totalMintable is hardcoded in the testfile TestToken3.sol

    // constructor(int _totalMintable) {
    //     totalMintable = _totalMintable;
    // }

    constructor() {}

    function mint(uint256 value) public isOwner {
        require(value + totalMinted < totalMintable);
        totalMinted += value;
        balances[msg.sender] += value;
    }
}
