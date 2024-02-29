// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/King.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract CounterTest is Test {
    King public king;

    function setUp() public {
        king = new King();
    }
    
    function test() public {
        address kingAddy = address(king);
        
    }
}
