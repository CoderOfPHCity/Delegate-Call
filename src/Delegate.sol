// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Delegate {
    address public setAddress;
    uint256 public value;

    constructor(address _addr) {
        setAddress = _addr;
    }

    fallback() external payable {
        (bool success, ) = setAddress.delegatecall(msg.data);
        require(success, "Delegatecall failed");
    }
}
