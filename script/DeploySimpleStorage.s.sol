// SPDX-License-Identifier: MIT
pragma solidity ^0.8.35;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage, Bank, StructArray} from "../contracts/SimpleStorage.sol";

contract DeploySimpleStorgae is Script {
    function run() external {
        vm.startBroadcast();

        new SimpleStorage();
        new Bank();
        new StructArray();
        vm.stopBroadcast();
    }
}
