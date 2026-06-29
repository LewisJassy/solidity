// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // we will work with solidity with version  either 0.8.18 or higher

contract SimpleStorage {
    // basic var types: boolean, uint, bytes, int, address etc
    bool hasFavoriteNumber = true;
    uint256 public favouriteNumber = 1; // can be accessed externally and internal
    int32 favouriteInt = 30;
    string favouriteString = "hi lewis";
    address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    // funtions
    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }
    // 1. Visibility: this controls who can call the func.
    // there is public - can be called by anyone externally and internally, private - can only be called internally, internal - can be called internally and by derived contracts, external - can only be called externally.
    // *function publicFn() public {}*
    // private - this can only be  called inside the contract, not even derived contracts can call it.
    // external - this can be only called from outside the function, not even inside the contract. but it can be called by derived contracts.
    // internal - this can be called by the contract and child contract via inheritance, ut never from outside

    // 2. State mutability: this controlls what a func can do with state variables. there is ...
    // pure - this func cannot read or write to state variables,
    // view - this func can read but not write to state variables,
    // payable - this func can receive ether,
    // non-payable - this func cannot receive ether.
}

