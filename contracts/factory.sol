// SPDX-License-Identifier: MIT License
pragma solidity ^0.8.9;

import "./twitterAccount.sol";

contract Factory {
    mapping(address => TwitterAccount) public accounts;

    function createAccount() public {
        require(
            address(accounts[msg.sender]) == address(0),
            "Account already exists!"
        );
        accounts[msg.sender] = new TwitterAccount();
        accounts[msg.sender].transferOwnership(msg.sender);
    }
}
