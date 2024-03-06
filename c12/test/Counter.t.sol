// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Privacy.sol";

contract CounterTest is Test {
    Privacy public priv;

    function setUp() public {
        priv = new Privacy([
            bytes32(0x63616e6469646174653100000000000000000000000000000000000000000000),0x6332000000000000000000000000000000000000000000000000000000000000,0x6333000000000000000000000000000000000000000000000000000000000000
        ]);
    }

    function testIncrement() public {
        bytes16 thing = priv.blah();
        bytes16 thing2 = 0xfcfc10e99dd70fdffed8f80f12eae104;
    }

}
