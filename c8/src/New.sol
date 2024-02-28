// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Blah {
  bool public locked;
}

contract New {
  function unlock(address addr) public returns (bool) {
    bytes32 pw = 0x412076657279207374726f6e67207365637265742070617373776f7264203a29;
    (bool ok, bytes memory data) = addr.call(abi.encodeWithSignature("unlock(bytes32)", pw));
    Blah thing = Blah(addr);
    bool locked = thing.locked();
    return locked;
  }

  function check(address addr) public returns (bool, bytes memory) {
    (bool ok, bytes memory data) = addr.call(abi.encodeWithSignature("locked()"));
    return (ok, data);
  }
}
