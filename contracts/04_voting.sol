//SPDX-License-Identifier:MIT
pragma solidity >=0.7.0 <0.8.0;
contract ballet
{//variables
struct vote{address voteraddress;
bool choice;

}
struct voter{
    string votername;
    bool voted;
}
uint private countresult=0;
uint public finalresult=0;
uint public totalvoter=0;
uint public totalvote=0;

address public ballotofficialaddress;
string public ballotofficialname;
string public proposal;

mapping(uint => vote) private votes;
mapping(address => voter) public voterregister;

enum State{Created,Voting,Ended}
State public state;

//modifier
modifier condition(bool _condition)
{
    require(_condition);
    _;

}
modifier onlyofficial()
{
    require(msg.sender==ballotofficialaddress);
    _;
}
modifier inState(State _state)
{
    require(state==_state);
    _;
}

//function
constructor(
 string memory _ballotofficialName,
string memory _proposal
) {
    ballotofficialaddress=msg.sender;
    ballotofficialname=_ballotofficialName;
    proposal=_proposal;
    state=State.Created;
}
function addVoter(
address _voteraddress,
string memory _voterName
)
public
inState(State.Created)
onlyofficial
{
    
    voter memory v;
    v.votername=_voterName;
    v.voted=false;
    voterregister[_voteraddress]=v;
    totalvoter++;
}
function startVote()
public
inState(State.Created)
onlyofficial
{
    state=State.Voting;

}
function doVote(bool _choice)
public
inState(State.Voting)
returns(bool voted)
{
    bool isFound=false;
    if(bytes(voterregister[msg.sender].votername).length!=0 && 
    voterregister[msg.sender].voted==false){
        voterregister[msg.sender].voted=true;
        vote memory v;
        v.voteraddress=msg.sender;
        v.choice=_choice;
        if(_choice)
        {
            countresult++;
        }
        votes[totalvote]=v;
        // totalvoter++;
        totalvote++;
        isFound=true;
    }
    return isFound;


}
function EndVote()
public
inState(State.Voting)
onlyofficial
{
state=State.Ended;
}



}