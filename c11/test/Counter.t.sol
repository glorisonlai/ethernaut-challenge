// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Elevator.sol";

contract CounterTest is Test {
    Elevator public elevator;
    BuildingEx public building;

    function setUp() public {
        elevator = new Elevator();
        building = new BuildingEx();
    }

    function testIncrement() public {
        console.log(building.isLastFloor(1));
        console.log(building.isLastFloor(1));
    }

    function testBlah() public {
        building.blah(address(elevator));
        console.log(building.top());
        console.log(elevator.top());
    }
}
