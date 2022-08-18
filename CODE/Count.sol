progma solidity ^0.5.6;
// State Variables
// 블록체인에 영구히 저장할 값들은 상태변수(State Variable)로 선언
// 어떤 값들은 반드시 State Variable로 선언되어야 함(ex.mapping)
// public 키워드를 사용해 변수를 외부에 노출 가능
// 이 경우 자동으로 해당 변수 값을 돌려주는 Getter 함수가 생성됨
contract Count{
    uint public count = 0;
    address public lastParticipant;
// 함수(Function)은 실행 가능한 코드를 정의한 것
// external, public, internal, private 중 하나로 visibility를 설정 가능
// payable, view, pure 등 함수의 유형을 정의 가능 
    function plus() public{
        count++;
        lastParticipant = msg.sender;
    }
}

// Function Modifiers
// 함수의 실행 전, 후의 성격을 정의
// 대부분의 경우 함수의 실행조건을 정의하는데 사용됨
contract Ballot{
    constructor() public { chairperson = msg.sender; }
    address chairperson;
    modifier onlyChair{
        require(msg.sender == chairperson, "Only the chairperson can call this function.");
        _;
    }
    function giveRightToVote(address to) public onlyChair{
        // 'onlyChair' modifier ensures that this function is called by the chairperson
    }
}

// Events
// 이벤트는 EVM 로깅을 활용한 시스템
// 이벤트가 실행시마다 트랜잭션 로그에 저장
// 저장된 로그는 컨트랙트 주소와 연동돼 클라이언트가 RPC로 조회 가능

contract Ballot{
    event Voted(address voter, uint proposal) public{
        emit Voted(msg.sender, proposal);
    }
}
const BallotContract = new caver.klay.Contract(abi, address);
BallotContract.events.Voted(
    {fromBlock : 0},
    function(error, event){
        console.log(event);
    }
).on('error', console.error);
