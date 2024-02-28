// script/CrossChainReceiver.s.sol

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "forge-std/Script.sol";
import {CrossChainReceiver} from "src/CrossChainReceiver.sol";

contract DeployCrossChainReceiver is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address ccipRouterAddress = 0xD0daae2231E9CB96b94C8512223533293C3693Bf;
        address simplifiedStakingAddress = 0x3aF67e03F41A9A5832b35E57E3250eA50f6e81b7;

        CrossChainReceiver crossChainReceiver = new CrossChainReceiver(
            ccipRouterAddress,
            simplifiedStakingAddress
        );

        console.log(
            "CrossChainReceiver deployed to ",
            address(crossChainReceiver)
        );

        vm.stopBroadcast();
    }
}