// Solidty 예제 - 상태(State Variables)
// "progma solidty" 키워드는 Solidity 버전을 지정
pragma solidity ^0.5.6;

// "contract X {...}"는 X라는 컨트랙트를 정의
contract Coin{

    // "minter"는 address 타입으로 선언된 상태; address 타입은 ETH에서 사용하는 160-bit 주소
    // public 키워드는 상태를 다른 컨트랙트로 읽을 수 있도록 허용
    address public minter;

    // "balances"는 mapping 타입으로 address 타입 데이터를 key로, unit 타입 데이터를 value로 가진 key-value mapping
    // mapping은 타 프로그래밍 언어에서 사용하는 해시테이블 자료구조와 유사
    // (uninitialized 값들은 모두 0으로 초기화 된 상태)
    mapping (address => unit) public balances;

    // [omitted state variables for brevity]

    // event로 정의된 타입은 클라이언트(application using a platform-specific SDK/Libray)가
    // listening 할 수 있는 데이터로 emit 키워드로 해당 타입의 객체를 생성해 클라이언트에게 정보를 전달
    // usage:
    // /* in Solidity */
    // emit Sent(an_address, another_address, 10);
    // /* in Web3.js */
    // Coin.Sent().watch({}, '', function(err, result){...});
    event Sent(address from, address to, uint amount);

    // [omitted for brevity]
}