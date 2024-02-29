// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;
contract fundMe2{
    // address of the owner of the contract
    address public owner;

    // total amount of fund raised
    uint256 public totalFund;

    // mapping to store contributions amount of address
    mapping(address=> uint256) public contributions;

    // constructor to set owner
    constructor() {
        owner=msg.sender;
    }

    // function to allow user to contribute
    function contribute() public payable{
        require(msg.value>0,"contributions must be greater than 0");
        contributions[msg.sender]+= msg.value;
        totalFund+=msg.value;

    }

    //function to withdraw fund by the owner
    function withdraw() public payable onlyOwner{
        payable(owner).transfer(address(this).balance);

    }

    // Modifier to restrict functions to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can withdraw funds");
        _; // This line allows the function code to run after the modifier check.
    }

}