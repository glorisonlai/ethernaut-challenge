// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "openzeppelin-contracts/contracts/utils/Strings.sol";
import "../src/King.sol";

contract CounterTest is Test {
    King public king;
    KingAttack public kinga;
    // bytes VALUE = 0x00000000000000000000000000000000000000000000000000038d7ea4c68000;

    function setUp() public {
        king = new King();
        kinga = new KingAttack();
    }
    
    // function test() public {
    //     address kingAddy = address(king);
    //     kinga.attack{value: 1}(kingAddy);
    //     console.log(king._king());
    // }

    function test2() public {
        address kingAddy = address(king);
        payable(kingAddy).call{value: 1}("");
        // assertEq(address(kinga).balance, 1);
    }
}
