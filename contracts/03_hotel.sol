pragma solidity ^0.6.0;
contract Hotel{
    address payable public owner;
    enum state {vacant,occupied}
        state currstate;
    constructor() public {
        owner=msg.sender;
        currstate=state.vacant;
    }
    modifier onlywhilevacant{
        require(currstate==state.vacant,"Currently occupied");
        _;
    }
    modifier costs(uint _amount)
    {
        require(msg.value>=_amount,"Not Enough Ether");
        _;
    }
    receive() external  payable  onlywhilevacant costs(2 ether){ 
        // require(state==state.vacant,"Currently occupied");
        // require(msg.value>=2,"Not Enough Ether")
        owner.transfer(msg.value);
        currstate=state.occupied;
    }
        


    
}