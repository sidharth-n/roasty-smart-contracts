// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Minimal Safe contract representing a community smart account
contract Safe {
    address public admin;

    event SafeCreated(address indexed admin);

    constructor(address _admin) {
        require(_admin != address(0), "Invalid admin address");
        admin = _admin;
        emit SafeCreated(admin);
    }
}

// Factory contract to deploy new Safe contracts for communities
contract SafeFactory {
    event SafeDeployed(address indexed admin, address safeAddress);

    // Deploys a new Safe and returns its address
    function deployCommunitySafe(address admin) public returns (address) {
        require(admin != address(0), "Invalid admin address");
        Safe newSafe = new Safe(admin);
        emit SafeDeployed(admin, address(newSafe));
        return address(newSafe);
    }
}
