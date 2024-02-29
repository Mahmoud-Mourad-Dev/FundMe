# Solidity smart contract example fundMe application
___

## fundMe1 example
#### 1- Users can contribute funds by calling the contribute function and sending Ether with the transaction.
#### 2- The contributed amount is stored in the contributions mapping, which maps addresses to their contributed amounts.
#### 3- The addresses of contributors are stored in the contributors array.
#### 4- The owner of the contract (deployer) can withdraw the funds by calling the withdraw function, which transfers the contract's balance to the owner's address.
#### 5- This is a basic example. Depending on your requirements, you might want to add more features such as withdrawal limits, fundraising goals, or refund functionality.



```solidity
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
```
___

## fundMe2 example







