pragma solidity ^0.6.0;

contract counter{
    uint public count=0;
    function increamentCount() public{
        count=count+1;
    }
}