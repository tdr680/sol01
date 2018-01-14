pragma solidity ^0.4.0;

// import "./mortal.sol";
import "github.com/ethereum/solidity/std/mortal.sol";

contract MyContract is mortal {
    
    uint myVariable;
    
    mapping(address => uint) myAddressMapping;
    
    function MyContract() public payable {
        
        myVariable = 5;
        myAddressMapping[msg.sender] = 1;
    }
    
    function setMyVariable(uint _myVariable) public {
        
        myVariable = _myVariable;
    }
    
    function getMyVariable() public view returns(uint) {
        
        return myVariable;
    }
    
    function getMyContractBalance() public view returns(uint) {
        
        return this.balance;
    }
    
    function () public payable {
        
    }
}
