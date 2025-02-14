// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title Community Safe Contract with Two Signers
/// @notice This Safe holds two signers:
///         1. Agent Roasty's Safe Account (hard-coded)
///         2. The admin's address (provided during deployment)
contract Safe {
    // Hard-coded Agent Roasty's safe account
    address public constant AGENT_ROASTY = 0xe05DCAf9206D125D7887919784756af8e69FaD89;
    
    // The admin (second signer), provided during deployment
    address public admin;

    /// @notice Emitted when the Safe is created with its two signers.
    event SafeCreated(address indexed agentRoasty, address indexed admin);

    /// @param _admin The admin's address which will serve as the second signer.
    constructor(address _admin) {
        require(_admin != address(0), "Invalid admin address");
        admin = _admin;
        emit SafeCreated(AGENT_ROASTY, admin);
    }
}

/// @title Safe Factory Contract
/// @notice Deploys a new Safe with two signers: Agent Roasty's account and the provided admin.
contract SafeFactory {
    /// @notice Emitted when a new Safe is deployed.
    event SafeDeployed(address indexed admin, address safeAddress);

    /// @notice Deploys a new community Safe.
    /// @param admin The address of the admin (second signer) who will be added to the new Safe.
    /// @return The address of the newly deployed Safe.
    function deployCommunitySafe(address admin) public returns (address) {
        require(admin != address(0), "Invalid admin address");
        Safe newSafe = new Safe(admin);
        emit SafeDeployed(admin, address(newSafe));
        return address(newSafe);
    }
}
