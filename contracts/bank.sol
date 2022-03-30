// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.7;

contract Bank {
    
    mapping (address => uint256) balance;
    
    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw() external payable {
        require(balance[msg.sender] > 0, "Balance must be larger than zero") ;
        (bool success, ) = payable(msg.sender).call{
            value: balance[msg.sender]
        }("");
        if (success) {
            balance[msg.sender] = 0;
        }
    }

    function bankBalance() public view returns (uint256){
        return address(this).balance;
    }

    function userBalance() public view returns (uint256) {
        return balance[msg.sender];
    }
}