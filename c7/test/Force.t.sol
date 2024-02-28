// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Force.sol";
import "../src/ForceStuffer.sol";

contract ForceTest is Test {
    Force public force;

    function setUp() public {
        force = new Force();
    }

    function testInitBalance() public {
        assertEq(address(force).balance, 0);
    }

    function testFallback() public {
        assertEq(address(force).balance, 0);
        address payable forceAddr = payable(address(force));
        new ForceStuffer{value: 1}(forceAddr);
        assertEq(address(force).balance, 1);
    }
}
