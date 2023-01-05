// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProxyContract {

    address immutable owner;
    
    constructor(){
        owner = msg.sender;
    }

    receive() external payable {}
    fallback() external payable {}
    
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function withdraw() public {
       require(owner == msg.sender);
       payable(owner).call{ value: address(this).balance }(""); 
    }

    
}
