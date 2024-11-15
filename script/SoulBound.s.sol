// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MyToken} from "../src/SoulBound.sol";

contract SoulBoundScript is Script {
    function setUp() public {}

    function run() public {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
      MyToken mytoken = new MyToken();
      console.log("address of Mytoken" , address(mytoken));
      vm.stopBroadcast();
    }
}
