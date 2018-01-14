pragma solidity ^0.4.0;

// import "./mortal.sol";
import "github.com/ethereum/solidity/std/mortal.sol";

contract SimpleWallet is mortal {
    
    mapping(address => Permission) myAddressMapping;
    
    struct Permission {
        bool isAllowed;
        uint maxTransferAmount;
    }
    
    function addAddressToSendersList(address permitted, uint maxTransferAmount) public onlyowner {
        
        myAddressMapping[permitted] = Permission(true, maxTransferAmount);
    }
    
    function sendFunds(address receiver, uint amountInWei) {
        
        if (myAddressMapping[receiver].isAllowed) {
            if (myAddressMapping[receiver].maxTransferAmount >= amountInWei) {
                bool sent = receiver.send(amountInWei);
                if (!sent) {
                    throw;
                }
            }
        }
    }
    
    function () public payable {
        
    }
}
