// N.B. 컨트랙트 함수는 함수를 실행한 TX의 정보를 받을 수 있는데 해당 정보를 msg 변수로 접근
// 자세한 정보는 https://solidity.readthedocs.io/en/v0.4.24/units-and-global-variables.html#block-and-transaction-properties

contract Coin {
    // [omitted state variables and event definitions for brevity]

    // 생성자 함수는 컨트랙트 생성 때 한번 실행
    // 아래 함수는 minter 상태변수에 msg.sender 값을 대입(함수 실행한 사람의 주소)
    constructor() public {
        minter = msg.sender;
    }

    // [omitted for breivty]
}