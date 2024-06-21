// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract counterman {
    uint256 public counter = 0;
    address public owner;
    constructor() {
        counter = 0;
        owner = msg.sender;
    }

    modifier onlyowner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function increment() public{
        counter++;
    }

    function decrement() public{
        require(counter > 0, "Can't be negative");
        counter--;
    }

    function reset() public onlyowner{
        counter = 0;
    }

    function getcount() public view returns (uint256)
    {
        return counter;
    }
}
