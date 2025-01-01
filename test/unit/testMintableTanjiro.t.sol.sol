//SPDX-LICENSE-Identifier: MIT; 
pragma solidity ^0.8.20; 
import {Test} from "forge-std/Test.sol"; 
import {MintableTanjiro} from "../../src/mintableTanjiro.sol"; 
contract TestMintableTanjiro is Test {
  MintableTanjiro mintTanjiro; 
  uint256 supply = 1000; 
  function setUp() external {
    mintTanjiro = new MintableTanjiro(supply); 
  }
  function testMintTanjiro() external {
    address nezuko = makeAddr("nezuko"); 
    uint256 _amount = 600; 
    vm.prank(address(this)); 
    mintTanjiro.mint(nezuko, _amount); 
    assertEq(mintTanjiro.balanceOf(nezuko), _amount); 
  }

}
