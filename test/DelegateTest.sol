// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/Delegate.sol";
import "../src/SetAddress.sol";


contract DelegateTest is Test {
    Delegate proxy;
    SetAddress newAddress;

    function setUp() public {
        newAddress = new SetAddress();
        proxy = new Delegate(address(newAddress));
    }

    function testDelegatecall() public {
        SetAddress newdeladr = SetAddress(address(proxy));

        newdeladr.setValue(2);

        assertEq(newdeladr.value(), 2);
    }
}
