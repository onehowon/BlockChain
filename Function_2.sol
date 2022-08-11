contract Coin {
    // [omitted state variables, event definitions, and constructors for brevity]

    // msg.sender가 receiver에게 amount만큼 Coin을 전송
    function send(address receiver, uint amount) public{
        require(amount <= balances[msg.sender], "Insufficient balance."); // 잔고가 충분한지 확인
        balances[msg.sender] -= amount; // 잔고차감
        balances[reciever] += amount; //잔고 증가
        emit Sent(msg.sender, receiver, amount); //이벤트 생성
    }
}