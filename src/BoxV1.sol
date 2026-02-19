// SPDX-Licence-Identifier: MIT
pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/lib/openzeppelin-contracts/contracts/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";




 contract BOXV1 is UUPSUpgradeable, OwnableUpgradeable{
    uint256 internal number;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers();
    }

    function initialize() initializer public {
        __Ownable_init(msg.sender);
        // __UUPSUpgradeable_init();
    }

    function getNumber() external view returns(uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override{}
}