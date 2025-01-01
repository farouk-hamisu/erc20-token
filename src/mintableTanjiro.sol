//SPDX-LICENSE-Identifier: MIT
pragma solidity ^0.8.20; 
import {Tanjiro} from "./tanjiro.sol"; 

contract MintableTanjiro is Tanjiro {
  constructor(uint256 _suppy) Tanjiro(supply){}
   function mint(address _to, uint256 _amount) external {
     supply += _amount; 
     balances[_to] += _amount; 
     emit Transfer(address(0), _to, _amount); 
   }

}
