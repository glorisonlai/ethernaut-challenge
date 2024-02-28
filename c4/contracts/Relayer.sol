// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Relayer {
  constructor(address _addr) {
    _addr.call(abi.encodeWithSignature("changeOwner(address)", msg.sender));
  }
}
