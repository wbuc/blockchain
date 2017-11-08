pragma solidity ^0.4.15;

import "./mortal.sol";

//import "github.com/ethereum/solidity/blob/develop/std/owned.sol"
contract SimpleWallet is mortal{

   mapping(address => Permission) permittedAddresses;
   
   event addressAddedToList(address addedByPerson, address allowedPerson, uint256 maxAmount);
   
   struct Permission{
       bool isAllowed;
       uint256 maxTransferAmount;
   }
    
    function addAddressToSendersList(
        address permitted, 
        uint256 maxTransferAmount) onlyOwner{
        permittedAddresses[permitted] = Permission(true, maxTransferAmount);
        
        addressAddedToList(msg.sender, permitted, maxTransferAmount);
    }  

    function sendFunds(address receiver, uint256 amountInWei){
        if(permittedAddresses[msg.sender].isAllowed){
            if(permittedAddresses[msg.sender].maxTransferAmount >= amountInWei){
               
               bool valueSent = receiver.send(amountInWei);
               if(!valueSent){
                   /*Handle value not sent.*/
                   throw;
               }
            } else{
                throw;
            }
        } else{
            throw;
        }
    }
    
    function disableAddress(address permitted) public {
      if(permittedAddresses[permitted].isAllowed) permittedAddresses[permitted].isAllowed = false;
    }
   
   function enableAddress(address permitted) public {
       if(!permittedAddresses[permitted].isAllowed) permittedAddresses[permitted].isAllowed = true;
    }
   
   function getAddressFunds(address sender) public constant returns (uint256){
        return sender.balance;
    }
   
    function removeAddress(address permitted) public {
       delete permittedAddresses[permitted];
    }

    function() payable{
    }
}
