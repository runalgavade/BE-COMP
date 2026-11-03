
 // SPDX-License-Identifier: Unlicensed
 // Specifies the license of the smart contract.

pragma solidity ^0.8.0;
// Specifies the Solidity compiler version.

contract Bank {
    // Defines a contract named Bank.

    uint256 public balance = 0;
    // Stores the current balance of the account.
    // uint256 is an unsigned integer.
    // public allows anyone to read this variable.

    address public accountOwner;
    // Stores the Ethereum address of the account owner.

    constructor() {
        // Executes only once when the contract is deployed.

        accountOwner = msg.sender;
        // Assigns the deployer's address as the account owner.
    }

    function deposit() public payable {
        // Allows the owner to deposit Ether.
        // payable allows the function to receive Ether.

        require(
            accountOwner == msg.sender,
            "You are not an account owner"
        );
        // Checks whether the caller is the account owner.

        require(
            msg.value > 0,
            "Amount should be greater than 0"
        );
        // Checks whether the deposited Ether is greater than zero.

        balance += msg.value;
        // Adds the deposited Ether to the account balance.
    }

    function withdraw() public payable {
        // Allows the owner to withdraw Ether.

        require(
            accountOwner == msg.sender,
            "You are not an account owner"
        );
        // Checks whether the caller is the account owner.

        require(
            msg.value > 0,
            "Withdrawal money should be greater than 0"
        );
        // Checks whether the withdrawal amount is greater than zero.

        balance -= msg.value;
        // Subtracts the withdrawal amount from the balance.
    }

    function showBalance() public view returns (uint256) {
        // Returns the current balance of the account.
        // view means the function does not modify contract state.

        require(
            accountOwner == msg.sender,
            "You are not an account owner"
        );
        // Allows only the account owner to check the balance.

        return balance;
        // Returns the current balance in Wei.
    }
}

