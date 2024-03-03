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
### Another basic example fundMe smart contract that allow user to contribute funds
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;
contract fundMe2{
    // address of the owner of the contract
    address public owner;

    // track total amount of fund raised
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
```
___
## fundMe3 Advanced
#### I take this contract example from patric collins course
#### First we start with two main function 
![Main Two Function](https://github.com/Mahmoud-Mourad-Dev/FundMe/assets/35864731/9636e19e-617c-41e1-ba14-e24485ae0e2d)

```solidity

// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;
contract fundMe3{

    /*  1- Function allow user to send money 

    */
    function fund() public {
        
    }

    function withdraw() public{

    }
}
```
### 1- We have to make fund function to recieve and sent ethereum to do that we use payable keyword
### 2- user should be send 1 ether at least we use require to do that
### 3- the require statement has the power to control the behavior of the transaction
### 4- soldity have global variable like (msg.value) number of wei send with transaction
### 5- 1ehereum = 1e18 wei [site converter](https://eth-converter.com/)
![fund function](https://github.com/Mahmoud-Mourad-Dev/FundMe/assets/35864731/ea777bbb-5958-43a2-bca9-c2d85d6a1952)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;
contract fundMe3{

    function fund() public payable {
        require (msg.value>=1e18,"you have to send at least 1 eth");
        
    }

    function withdraw() public{

    }
}
```
### 1- replace minimum fund from 1 eth to 5 dollar
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;
contract fundMe3{
    uint256 minimumUsd=5;

    function fund() public payable {
        require (msg.value>=minimumUsd,"you have to send at least 1 eth");
        
    }

    function withdraw() public{

    }
}
```
![Convert eth to usd](https://github.com/Mahmoud-Mourad-Dev/FundMe/assets/35864731/c40c85aa-f66a-42c2-8b09-f4ac45ab1ebc)


### 1- how to convert ethereum to dollar using chainlink data feeds
### 2- This conversion requires us to identify the price of Ethereum
### 3- chainlink [data feeds](https://docs.chain.link/data-feeds/using-data-feeds)
### 4- chainlink Price feeds [address](https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&page=1&search=)

```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

contract fundMe3{
    uint256 minimumUsd=5;

    function fund() public payable {
        require (msg.value>=minimumUsd,"you have to send at least 1 eth");
        
    }

    function withdraw() public{

    }

    function getPrice() public{

    }

    function getConversionRate() public{

    }
}
```
 ![solidity interface](https://github.com/Mahmoud-Mourad-Dev/FundMe/assets/35864731/b161217b-ae12-4a12-8004-7feae51f1625)

 ### 1- Chainlink Data Feeds sepolia testnet address [0x694AA1769357215DE4FAC081bf1f309aDC325306](https://docs.chain.link/data-feeds/price-feeds/addresses?network=ethereum&page=1&search=)
### 2- [AggregatorV3Intrerface](https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol)






 







