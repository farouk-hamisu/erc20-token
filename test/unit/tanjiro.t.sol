//SPDX-LICENSE-Identifier: MIT; 
pragma solidity ^0.8.20; 
import {Tanjiro} from "../../src/tanjiro.sol"; 
import {Test, console} from "forge-std/Test.sol";
contract TanjiroTest is Test {
  Tanjiro public tanjiro;
  uint256 constant INITIAL_SUPPLY = 100000; 
  uint256 constant AMOUNT_TO_BE_TRANSFERED = 1000; 
  //explicitly declaring events here 
  event Transfer(address indexed _from, address indexed _to, uint256 _amount); 
  event Approval(address indexed _owner, address indexed _spender, uint256 _amount); 
  function setUp() public {
    tanjiro = new Tanjiro(INITIAL_SUPPLY); 
  }
  function testTokenName() public{
    assertEq("tanjiro", tanjiro.name()); 
  }
  function testTotalSupply() public {
    assertEq(INITIAL_SUPPLY, tanjiro.totalSupply()); 
  }
  function testTokenSymbol() public {
    assertEq("TJO", tanjiro.symbol()); 
  }
  function testTokenTransfer() public {
    address nezuko = getUser(); 
    tanjiro.transfer(nezuko, 1000); 
    assertEq(tanjiro.balanceOf(nezuko), 1000); 
    assertEq(tanjiro.balanceOf(address(this)), INITIAL_SUPPLY - AMOUNT_TO_BE_TRANSFERED); 
  }
  function testTokenEmitTransferEvent() public {
    address _from = address(this); 
    address _to = getUser(); 
    uint256 _amount = AMOUNT_TO_BE_TRANSFERED; 
    // test all event parameters
    vm.expectEmit(); 
    emit Transfer(_from, _to, _amount);
    // triggering event
    tanjiro.transfer(_to, _amount); 
  }
  function testTokenSpendingApproval() public{
    address nezuko = getUser(); 
    uint256 approvedAmount = 500; 
    tanjiro.approve(nezuko, 500); 
    assertEq(tanjiro.allowance(address(this), nezuko), approvedAmount); 
 }
 function testTokenEmitApprovalEvent() public {
   address _owner = address(this); 
   address _spender = getUser(); 
   uint256 _amount = 600; 
   vm.expectEmit(); 
   emit Approval(_owner, _spender, _amount); 
   tanjiro.approve(_spender, _amount); 
 }
 function testTokenTransferFrom() public {
   address nezuko = getUser(); 
   address zenitsu = makeAddr("zenitsu"); // i know i should have refactor the getUser function but i am lazy so
   tanjiro.approve(nezuko, 1500);
   vm.prank(nezuko); 
   tanjiro.transferFrom(address(this), zenitsu, 800); 
   assertEq(tanjiro.balanceOf(zenitsu), 800); 
 }
  //simple getter
  function getUser() public returns (address){
    return makeAddr("nezuko"); 
  }
}

