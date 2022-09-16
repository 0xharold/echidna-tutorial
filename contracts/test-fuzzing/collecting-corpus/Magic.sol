// SPDX-License-Identifier: MIT

/**
 * This task is hard for a fuzzer -> better to use symbolic execution tool like Manticore
 * @dev echidna-test Magic.sol --config config.yaml
 * more info at: https://github.com/crytic/building-secure-contracts/blob/master/program-analysis/echidna/collecting-a-corpus.md 
 */

pragma solidity 0.8.7;

contract C {
    bool value_found = false;

    function magic(
        uint256 magic_1,
        uint256 magic_2,
        uint256 magic_3,
        uint256 magic_4
    ) public {
        require(magic_1 == 42);
        require(magic_2 == 129);
        require(magic_3 == magic_4 + 333);
        value_found = true;
        return;
    }

    function echidna_magic_values() public returns (bool) {
        return !value_found;
    }
}
