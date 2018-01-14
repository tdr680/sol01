pragma solidity ^0.4.0;

contract mortal {
    
    address owner;
    
    modifier onlyowner() {
        if (msg.sender == owner) {
            _;
        } else {
            throw;
        }
    }

    function mortal() public {
        
        owner = msg.sender;
    }
    
    function kill() public onlyowner {
        
        selfdestruct(owner);
    }
}
