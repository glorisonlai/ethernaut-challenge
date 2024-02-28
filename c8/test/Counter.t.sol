// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Vault.sol";
import "../src/New.sol";

contract CounterTest is Test {
    Vault public vault;
    New public thing;

    function setUp() public {
        vault = new Vault(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
        thing = new New();
    }

    function testPasswor() public {
        address vaultAddr = address(vault);
        (bool res, bytes memory dat) = thing.check(vaultAddr);
        console.log(res);
        console.logBytes(dat);
        console.log(thing.unlock(address(vault)));
        (res, dat) = thing.check(vaultAddr);
        console.log(res);
        console.logBytes(dat);
    }
}
