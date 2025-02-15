// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGnosisSafeProxyFactory {
    function createProxy(address singleton, bytes memory data)
        external
        returns (address proxy);
}

interface IGnosisSafe {
    function setup(
        address[] memory _owners,
        uint256 _threshold,
        address to,
        bytes memory data,
        address fallbackHandler,
        address paymentToken,
        uint256 payment,
        address payable paymentReceiver
    ) external;
}

/**
 * @title SafeFactory
 * @notice Deploys an official Gnosis Safe proxy with two signers:
 *         1. Agent Roasty's safe account (hard-coded)
 *         2. The admin's address (passed to deployCommunitySafe)
 *
 * The function and event names remain the same so your front end doesn't need changes
 * except for updating the contract address.
 */
contract SafeFactory {
    // Hard-coded Agent Roasty's safe account (this is Agent Roasty's Safe account)
    address public constant AGENT_ROASTY = 0xe05DCAf9206D125D7887919784756af8e69FaD89;
    
    // Official Gnosis Safe singleton (master copy) on Sepolia
    address public constant GNOSIS_SAFE_SINGLETON = 0xD9DBD2f077c5A0417a8b9F54F17b93f6F41f7C71;
    
    // Official Gnosis Safe Proxy Factory on Sepolia
    address public constant GNOSIS_SAFE_PROXY_FACTORY = 0x9416E7b49806F370E353F69C5615B5dE7C79D74A;

    // Create an instance of the proxy factory
    IGnosisSafeProxyFactory proxyFactory = IGnosisSafeProxyFactory(GNOSIS_SAFE_PROXY_FACTORY);

    // Event remains unchanged
    event SafeDeployed(address indexed admin, address safeAddress);

    /**
     * @notice Deploys a new Gnosis Safe with two owners:
     *         - Agent Roasty's safe account (hard-coded)
     *         - The admin's address (provided as parameter)
     * @param admin The admin's address (second signer)
     * @return The address of the newly deployed Gnosis Safe proxy
     */
    function deployCommunitySafe(address admin) public returns (address) {
        require(admin != address(0), "Invalid admin address");

        // Prepare the owners array with two signers: Agent Roasty and the admin
        address[] memory owners = new address[](2);
        owners[0] = AGENT_ROASTY;
        owners[1] = admin;

        // Set threshold to 2 (both signatures required)
        uint256 threshold = 2;

        // Encode the setup() call for the Gnosis Safe:
        // - to: address(0)
        // - data: empty
        // - fallbackHandler, paymentToken: address(0)
        // - payment: 0, paymentReceiver: address(0)
        bytes memory setupData = abi.encodeWithSelector(
            IGnosisSafe.setup.selector,
            owners,
            threshold,
            address(0),
            "",
            address(0),
            address(0),
            0,
            payable(address(0))
        );

        // Deploy a new proxy using the official Gnosis Safe Proxy Factory.
        address safeAddress = proxyFactory.createProxy(
            GNOSIS_SAFE_SINGLETON,
            setupData
        );

        emit SafeDeployed(admin, safeAddress);
        return safeAddress;
    }
}
