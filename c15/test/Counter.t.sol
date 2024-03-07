// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NaughtCoin.sol";

contract CounterTest is Test {
    NaughtCoin public coin;
    Attack public attack;

    function setUp() public {
        coin = new NaughtCoin(address(this));
        attack = new Attack();
    }

    function testIncrement() public {
        console.log(coin.balanceOf(address(this)));
        coin.approve(address(this), 1);
        coin.transferFrom(address(this), address(attack), 1);
        // attack.thing(address(coin), address(this), 1);
        console.log(coin.balanceOf(address(this)));
    }
}
