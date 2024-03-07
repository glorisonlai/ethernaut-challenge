// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Gatekeeper.sol";

contract CounterTest is Test {
    GatekeeperOne public gate;
    Attack public attacker;

    function setUp() public {
        gate = new GatekeeperOne();
        attacker = new Attack();
    }

    function testIncrement() public {
        // bytes8 _gateKey_prod = 0x10000000000022e5;
        bytes8 _gateKey = 0x10000000000079c8;
        console.log(uint16(uint160(tx.origin)));
        require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
        require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
        require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
    }

    // function testBlah() public {
    //     for (uint256 i = 0; i < 8191; i++) {
    //         if (attacker.attack{gas: 391090 + i}(address(gate), 0x10000000000022e5)) {
    //             console.log(391090 + i);
    //             break;
    //         }
    //     }
    //     // (bool success, bytes memory thing) = address(attacker).call{gas: 10000000}(abi.encodeWithSignature("attack(address,bytes8)", address(gate), 0x10000000000022e5));
    //     // console.log(success);
    // }
}
