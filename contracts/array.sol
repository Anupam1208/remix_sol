pragma solidity ^0.6.0;
contract mycontract{
    uint[] public uarray=[1,2,3,4];
    string[] public sarray=["my","name","is"];
    string[] public mystr;
    function addvalue(string memory _value) public{
        mystr.push(_value);
    }
    function mlength() public view returns(uint){
        return mystr.length;
    }
}