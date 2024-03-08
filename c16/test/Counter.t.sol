// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function bytesToUint(bytes memory b) internal override pure returns (uint256){
        uint256 number;
        for(uint i=0;i<b.length;i++){
            number = number + uint(uint8(b[i]))*(2**(8*(b.length-(i+1))));
        }
    return number;
}


    function testIncrement() public {
        address addy = 0xEf24aBd50999a6699F84aEf70c1B7046B010E28a;
        uint thing = bytesToUint(abi.encodePacked(addy));
        console.log(thing);
    }
}
