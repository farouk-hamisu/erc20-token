//SPDX-LINCENSE-Identifier: MIT
pragma solidity ^0.8.20; 
import {Script}  from "forge-std/Script.sol"; 
import {MintableTanjiro} from "../src/mintableTanjiro.sol"; 

contract DeployTanjiro is Script {
  uint256 INITIAL_SUPPLY = 100000; 
  function run() public {
    vm.startBroadcast(); 
      new MintableTanjiro(INITIAL_SUPPLY); 
    vm.stopBroadcast(); 
  }
}
