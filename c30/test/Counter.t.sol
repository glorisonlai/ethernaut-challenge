// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Switch.sol";

contract CounterTest is Test {
    Switch public switchy;

    function setUp() public {
        switchy = new Switch();
    }

    function testIncrement() public {
        console.logBytes4(bytes4(keccak256("turnSwitchOff()")));
        console.logBytes4(bytes4(keccak256("turnSwitchOn()")));
        switchy.flipSwitch(abi.encodeWithSignature("turnSwitchOff()"));
        console.log(switchy.switchOn());
    }
}
