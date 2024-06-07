// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.15;

contract SendWithdrawMoney {
    uint public balanceReceived;

    function deposit() public payable {
        balanceReceived += msg.value;
    }

    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawToAddress(address payable to) public{
        to.transfer(getContractBalance());
    }

    function withdrawAll() public{
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }
}
