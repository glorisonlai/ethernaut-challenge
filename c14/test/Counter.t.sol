// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Gatekeeper.sol";

contract CounterTest is Test {
    GatekeeperTwo public gate;

    function setUp() public {
        gate = new GatekeeperTwo();
    }

    // function testIncrement() public {
    //     console.log(type(uint64).max);
    //     console.log(type(uint64).max ^ uint64(
    //             bytes8(
    //                 keccak256(
    //                     abi.encodePacked(msg.sender)))));
    //     console.log(uint64(
    //             bytes8(
    //                 keccak256(
    //                     abi.encodePacked(msg.sender)))) ^ type(uint64).max);
    //     bytes8 _gateKey = 0xfc728be92e6a827e;
    //     require(
    //         uint64(
    //             bytes8(
    //                 keccak256(
    //                     abi.encodePacked(msg.sender))))
    //                     ^ uint64(_gateKey) == type(uint64).max);
    // }

    function testBlah() public {
        // bytes8 thing = bytes8(uint64(
        //         bytes8(
        //             keccak256(
        //                 abi.encodePacked(address(this))))) ^ type(uint64).max);
        new Attack(address(gate));
    }

}
