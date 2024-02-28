// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoinFlipCopy {
  uint256 public consecutiveWins;
  uint256 lastHash;
  uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

  constructor() {
    consecutiveWins = 0;
  }

  function flip(address addr) public returns (bool,bool,bool) {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    uint256 coinFlip = blockValue / FACTOR;
    bool side = coinFlip == 1 ? true : false;

    (bool success, bytes memory data) = addr.call(abi.encodeWithSignature("flip(bool)", side));
    bool flipResult = abi.decode(data, (bool));

    return (success, side, flipResult);
  }
}
