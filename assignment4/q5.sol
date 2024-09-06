// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Donation {
    // Mapping to keep track of the total donations received by each recipient
    mapping(address => uint256) public donations;

    // Event to be emitted when a donation is made
    event DonationReceived(address indexed donor, address indexed recipient, uint256 amount);

    // Function to donate to a specific recipient
    function donate(address recipient) external payable {
        require(msg.value > 0, "Donation amount must be greater than zero");

        // Update the donation amount for the recipient
        donations[recipient] += msg.value;

        // Emit an event for the donation
        emit DonationReceived(msg.sender, recipient, msg.value);
    }

    // Function to get the total donations for a recipient
    function getDonations(address recipient) external view returns (uint256) {
        return donations[recipient];
    }
}
