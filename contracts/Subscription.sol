// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Subscription {
    // Hard-coded project Safe address (your treasury Safe)
    address payable public constant projectSafe = payable(0x7f994977d4546e1e5e2F3731ec46fdEf3e828e9D);

    // Event to log a successful subscription
    event Subscribed(address indexed user, uint256 timestamp);

    // Function to subscribe by sending exactly 0.005 Sepolia ETH
    function subscribe() external payable {
        require(msg.value == 0.005 ether, "Incorrect subscription amount");
        
        // Forward funds to the project's Safe
        (bool sent, ) = projectSafe.call{value: msg.value}("");
        require(sent, "Failed to forward funds");

        emit Subscribed(msg.sender, block.timestamp);
    }
}
