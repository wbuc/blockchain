pragma solidity ^0.4.15;

contract SampleWallet{
    
    uint256 balance;
    address owner;
   
    function SampleWallet() payable{
        balance = 25;
        owner = msg.sender;
    }
    
    function updateBalance(uint256 newValue) {
        balance = newValue;
    }
    
    function getBalance() constant returns (uint256){
        
        return balance;
    }
    
 
}
