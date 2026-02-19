//SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";
import {BOXV1} from "../src/BoxV1.sol";
import {BOXV2} from "../src/BoxV2.sol";

contract DeployAndUpgradeTest is Test{
    DeployBox public deployScript;
    UpgradeBox public upgradeScript;
    address public OWNER = makeAddr("owner");

    address public proxy;

    function setUp() public {
        deployScript = new DeployBox();
        upgradeScript = new UpgradeBox();
        proxy = deployScript.run();
    }

    function testUpgrade() public {
        BOXV2 boxV2 = BOXV2();

        upgradeScript.upgradeBox (proxy, address(boxV2));

        uint256 expectedValue = 2;
         assertEq(expectedValue, BOXV2(proxy).version());

        BOXV2(proxy).setNumber(42);
        assertEq(42, BOXV2(proxy).getNumber());
    }
}