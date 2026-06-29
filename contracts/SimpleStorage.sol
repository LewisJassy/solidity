// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // we will work with solidity with version  either 0.8.18 or higher

contract SimpleStorage {
    // basic var types: boolean, uint, bytes, int, address etc
    bool hasFavoriteNumber = true;
    uint256 favouriteNumber = 88;
    int32 favouriteInt = 30;
    string favouriteString = "hi lewis";
    address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function store(uint256 _favouriteNumber) public {
        favouriteNumber = _favouriteNumber;
    }
}
