pragma solidity ^0.4.15;

contract mortal{
    address owner;
    
    modifier onlyOwner(){
        if(owner == msg.sender){
          _;  
        }
        else{
            throw;
        }
    }
    
    function mortal(){
        owner = msg.sender;
    }
    
    function kill() onlyOwner {
        selfdestruct(owner);
    }
    
}
