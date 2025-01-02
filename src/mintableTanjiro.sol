// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {Tanjiro} from "./tanjiro.sol";

contract MintableTanjiro is Tanjiro {
    uint256 constant MAXIMUM_MINTABLE_TOKENS = 5;

    constructor(uint256 _supply) Tanjiro(_supply) {}

    modifier limitTokens(address _to, uint256 _amount) {
        require(_amount <= MAXIMUM_MINTABLE_TOKENS, "Amount exceeds maximum mintable tokens");
        require(balances[_to] < type(uint256).max - 1000, "Balance overflow risk");
        _;
    }

    function mint(address _to, uint256 _amount) external limitTokens(_to, _amount) {
        supply += _amount;
        balances[_to] += _amount;
        emit Transfer(address(0), _to, _amount);
    }
}

