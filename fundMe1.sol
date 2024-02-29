// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

contract fundMe1 {
    // mapping store the amount of contributed
    mapping (address => uint256) public contributions;
    // array store address of contributors
    address [] public contributors;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // the main two function in this contract 
    function contribute() public payable{
        //contributions must be greater than 0
        require(msg.value>0,"contributions must be greater than 0");
        // add address of contributions to mapping
        if (contributions[msg.sender]==0){
            contributors.push(msg.sender);


        }
    }


    function withdraw() public{
        require(msg.sender== owner,"owner can only withdraw this fund");
        // withdraw all balance 
        payable(msg.sender).transfer(address(this).balance); 

    }

    }
    

    

