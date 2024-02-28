// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Send {
  function send(address payable _to) public payable {
    (bool sent, bytes memory data) = _to.call{value: msg.value}("");
    require(sent, "Failed to send Ether");
  }
}

