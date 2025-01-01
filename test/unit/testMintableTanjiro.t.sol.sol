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
    uint256 _amount = 1; 
    mintTanjiro.mint(nezuko, _amount); 
    assertEq(mintTanjiro.balanceOf(nezuko), _amount); 
  }
  function testBreakMintWithSmallNumber() external {
    address nezuko = makeAddr("nezuko"); 
    mintTanjiro.mint(nezuko, 1); 
  }
  function testBreakMintWithBigNumber() external {
    address nezuko = makeAddr("nezuko"); 
    vm.expectRevert(); 
    mintTanjiro.mint(nezuko, type(uint256).max); 
  }

}
