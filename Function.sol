contract Coin {
    // [omitted state variables, event definitions, and constructors for brevity]
    // receiver 주소에 amount 만큼의 새로운 Coin을 부여
    // require 함수는 입력값이 true일 때만 다음으로 진행할 수 있음(타 언어의 assert와 유사)
    // require 함수는 특정조건을 만족할 경우에만 함수를 실행할 수 있도록 강제할 때 사용
    function mint(address receiver, uint amount) public{
        require(msg.sender == minter); // 함수를 실행한 사람이 minter(i.e. 컨트랙트 소유자)일 때만 진행
        require(amount < 1e60); // 새로 생성하는 Coin의 양이 1 * 10 ^ 60개 미만일때만 진행
        balances[receiver] += amount; // receiver 주소에 amount 만큼을 더함 
    }
}