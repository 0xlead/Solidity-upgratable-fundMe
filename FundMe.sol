// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

error FundMe__NotAuthorized();

/// @title FundMe
/// @notice This should always be the smart contract to be funded
/// @notice This smart contract acts as a carrier
contract FundMe {
    
    event OwnerChanged(address indexed oldAdmin, address newAdmin);
    event ContractChanded(address oldContract, address newContract);
    address private owner;
    address upgratableContract;
    
    mapping(address => uint256) public funders;

    constructor(){
        owner = msg.sender;
        emit OwnerChanged(msg.sender,);
    }

    // modifiers
    modifier onlyOwner() {   
     if(owner !== msg.sender){
        revert FundMe__NotAuthorized();
     } 
      _;
    }
  
    receive() external payable {
          payable(upgratableContract).call{ value: address(this).balance }(""); 
    }

    fallback() external payable {
        payable(upgratableContract).call{ value: address(this).balance }("");   
    }
    
    function fund(uint256 _amount) public payable {
        if(msg.value >= _amount){
            funders[msg.sender] += _amount;
        }
        revert("insufficient fund");
    }

    /// @param _newContract new fundMe contract address
    function setProxy(address _newContract) public onlyOwner {
        upgratableContract = _newContract;
        emit ContractChanded(upgratableContract, _newContract);
    }
    
    /// @param _newOwner Address of the new owner of the contract
    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
        emit OwnerChanged(owner, _newOwner);
    }


}
