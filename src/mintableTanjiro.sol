//SPDX-LICENSE-Identifier: MIT
pragma solidity ^0.8.20; 
import {Tanjiro} from "./tanjiro.sol"; 

contract MintableTanjiro is Tanjiro {
  constructor(uint256 _supply) Tanjiro(_supply){}
  uint256 maximumAllowedMintableTokens = 5; 
  modifier limitTokens(uint256 _amount, address _to){
     require(_amount >= maximumAllowedMintableTokens); 
     require(balances[_to] < type(uint256).max-1000); 
     _; 
  }
   function mint(address _to, uint256 _amount) external limitTokens(_amount, _to){
     supply += _amount; 
     balances[_to] += _amount; 
     emit Transfer(address(0), _to, _amount); 
   }

}
