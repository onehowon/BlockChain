# 합의 알고리즘
## 1. PoW(Proof of Working)
### 1) 제안 자격 취득 방법 : 계산이 어려운 문제를 풀 것
### 2) 네트워크 참여 제한 : 없음
### 3) 합의에 필요한 연산량 : 높음
### 4) 위협 : 전체 연산량의 51%를 한 참여자가 소유시 중앙화 됨
### 5) 대표 블록체인 : BTC, LTC, ETH, Monero, QTM
### Ref) 지금의 블록을 가지고 해쉬를 만듦, 갈수록 노드 참여가 힘들어진다.

## 2. PoS(Proof of Stake)
### 1) 제안 자격 취득 방법 : 플랫폼 토큰을 보유한 양과 기간에 따라 결정적으로 또는 확률적으로 뽑힐 것
### 2) 네트워크 참여 제한 : 없거나 낮음
### 3) 합의에 필요한 연산량 : 낮음
### 4) 위협 : 전체 토큰의 51%를 한 참여자가 소유시 중앙화 됨
### 5) 대표 블록체인 : ETH FFG & CFG, EOS(dPOS)
### Ref) 토큰이 많은 사용자가 다음 블록의 제안권을 가짐, PoW로 경쟁을 하다가 PoS로 가려는 구조(ETH)

## 3. BFT-variants
### 1) 제안 자격 취득 방법 : 정해진 순번 또는 정해진 확률에 의해 뽑힐 것 
### 2) 네트워크 참여 제한 : 높음
### 3) 합의에 필요한 연산량 : 낮음
### 4) 위협 : 전체 참여노드의 1/3이상이 담합할 경우 합의 불가, 전체 참여 노드의 2/3 이상이 담합 시에 중앙화 됨
### 5) 대표 블록체인 :  Klaytn, Hyperledger Fabric, Ontology, Tendermint
### Ref) 클레이튼은 1초에 4000개의 Transaction을 담을 수 있음

## Nonce
### 해쉬를 하면 항상 같은 값이 나오는데 앞에 아무런 숫자를 넣으면 다른 해쉬 값이 나옴. 의미는 없지만 해쉬값을 크게 바꾸기 위한 어떤 Garbage 값
#### CPU - 해쉬를 만드는데 취약하다(고차원 연산을 하는 HW)
#### GPU - 단순한 HW, 코어가 많을 수록 연산이 빨라짐
#### Difficulty - 채굴 난이도
#### GPU 세대로 들어서면서 Difficulty 상승

# 블록체인 구분하는 정의
## 기준 1) 누구든지 기록된 정보(블록)를 자유롭게 읽을 수 있는지?
## 기준 2) 명시적 등록 또는 자격취득 없이 정보를 블록체인 네트워크에 기록할 수 있는지?
### Public : 블록체인의 정보가 공개 돼있고 네트워크가 정한 기준에 따라 정보를 기록요청할 수 있다.
### Private : 미리 자격을 득한 사용자만이 정보를 기록할 수 있다.
### Permissionless : 네트워크의 참여가 제한된 경우
### Permissioned : 그렇지 않은 경우

# 네트워크 참여의 정의
## (넓은 의미) 블록체인 P2P 네트워크에 참여
## (좁은 의미) 합의과정에 참여

# 공개키 암호화 전자서명
## 1. 암호화
### 1) 고전적 암호: 카이사르 암호
##### - 암호화 하려는 내용을 알파벳별로 일정한 거리만큼 밀어서 다른 알파벳으로 치환하는 기법

### 2) 대칭키 암호/비대칭키 암호
#### - 평문 : 암호화 되어 있지 않은 문자열
#### - 암호화 : 평문을 암호로
#### - 복호화 : 암호를 평문으로

### 암호화 / 복호화 사용키 동일 시 대칭키 암호
### 암호화 / 복호화 사용키 다를 시 비대칭키 암호

### 3) 암호화 사용되는 키 : 공개키(PK)
### 4) 복호화 사용되는 키 : 비밀키(Private Key, Secret Key, SK)
### 5) 비대칭키 암호화 목적 : 누구든지 암호화 가능하지만 비밀키 아는 사람만 복호화 가능
#### 비밀키 -> 공개키 도출 쉬움
#### 공개키 -> 비밀키 도출 어려움(암호학적으로)
#### Ref) 비대칭키 암호는 지정된 사람만 정보를 확인할 수 있도록 도움(privacy)

# 전자서명 
## 블록체인의 암호화 기법
### - 모든 노드가 같은 정보를 공유
### - 암호학적인 소유권 확인(은행은 누구에게 속하는지 알 수 있음)
#### 1) 대부분의 블록체인 주소는 공개키로부터 도출한 값
##### BTC ) Hash 160 of public key where Hash 160 = RIPEMD160 + SHA256
##### - 임의의 주소 X에 10 BTC가 있다고 가정할 때 Alice는 X에서 또 다른 임의의 주소 Y로 5 BTC를 전송하는 거래를 성사하기 위해 X로 변환되는 공개키와 짝을 이루는 비밀키로 해당 거래를 서명할 수 있어야 함
##### ETH ) Rightmost 160 bits of Keccak hash of a public key
##### - 임의의 주소 X에 위치한 어카운트 잔고에 10 ETH가 있다고 가정할 때 Alice는 X에서 또 다른 임의의 주소 Y에 위치한 어카운트로 5 ETH를 전송 하는 거래를 성사하기 위해 X로 변환되는 공개키와 짝을 이루는 비밀키로 해당 거래를 서명할 수 있어야 함

# 구현 방법으로 나눈 블록체인
## 1) UTXO (Unspent Transaction Output) 기반
### - 블록체인에 사용 가능한 토큰 - UTXO 사용 자격검증방법 기록
### - 일반적 자격검증방법은 UTXO의 정보와 일치하는 공개키로 검증가능한 전자서명을 제출
### - BTC가 대표

## 2) 어카운트 기반 블록체인
### - 어카운트는 블록체인을 구성하는 주체를 표현하며 상태 기록

## 3) ETH 어카운트 주소, 상태
### - 어카운트는 EOA(Externally Owned Account)와 스마트컨트랙트로 구분
### - ETH 사용자는 EOA 사용

## 4) 트랜잭션 : 어카운트의 행동
### - 블록체인 참여자들은 블록 검증 시 트랜잭션들이 올바른 순서대로 정렬되어있는지를 합의
### Confirmation 숫자는 트랜잭션이 블록에 포함된 이후 생성된 블록 숫자
#### ex) 임의 트랜잭션 T가 포함된 블록 높이가 100, 현재 블록 높이가 105라면 T의 con 숫자는 6

#### PoW 를 사용하는 블록체인들은 Finality가 없어서 confirmation 숫자가 중요
#### Finality란 블록의 완결성을 의미
#### - 합의를 통해 생성된 블록이 번복되지 않을 경우 완결성 존재
#### Pow 기반 합의는 확률 기반으로 경우에 따라 블록이 사라질 수도 있으므로 완결성이 부재

## BFT Based 블록체인
### - 블록의 완결성이 보장됨
### - 네트워크 동기화 때문
### - 블록생성이 PoW에 비해 빠르고 경제적
### - 정해진 네트워크에서는 굉장히 효율적
### - 네트워크 동기화 필요로 인해 참여자 숫자 제한

# Klaytn
## Klaytn BFT - 확장가능한 BFT 사용
### - PoW 자체가 비효율적인 구조
### N 개 노드 가운데 S개 부분노드 집합을 확률적으로 선택 후 전체집합을 거버넌스 카운실 부분집합을 커미티 정의
### 커미티 선택은 VRF*(Verifiable Random Function)로 구해진 무작위값 기반 매 블록마다 새 커미티 뽑아 BFT 실행

# Blockchain State(블록체인 상태)
## - 블록체인은 트랜잭션으로 변화하는 상태 기계(State Machine)

## 1) 상태 기계
### - 블록체인은 초기 상태에서 변경사항을 적용하여 최종 상태로 변화하는 상태 기계
### - 이전 블록의 최종 상태는 현재 블록의 초기 상태
### - Gen block의 경우 임의 초기값들이 설정되는데 이게 gen block의 초기상태이자 최종 상태

## - (어카운트 기반) 블록체인 상태
## - TX는 어카운트를 생성하거나 변경
### -- e.g Alice가 기존 존재하지 않던 주소 X에 1 ETH를 전송하면 새로운 EOA 생성
### -- e.g Alice가 새로운 스마트 컨트랙트를 배포(컨트랙트도 어카운트)
### -- e.g Alice가 Bob에게 5 eth를 전송하는 TX가 체결되면 Alice의 Bob의 잔고가 변경
### -- 항상 같은 결과를 보장하기 위해 하나의 TX가 반영되는 과정에서 다른 TX의 개입은 제한됨

# 1. 트랜잭션과 어카운트
## ETH 어카운트의 종류
### 1) External Account : 사용자가 사용하는 어카운트
### 2) Contract Account : 스마트 컨트랙트를 표현하는 어카운트

## ETH - EOA와 스마트 컨트랙트 상태를 기록 및 유지
### 스마트 컨트랙트 : 특정주소에 존재하는 실행 가능한 프로그램
### 프로그램은 상태를 가지기에 ETH/KLAY는 스마트컨트랙트를 어카운트로 표현
### EOA는 블록에 기록되는 TX를 생성
### 블록에 기록되는 TX들은 명시적 변경을 일으킴

# 2. TX와 GAS
## 1) TX의 목적은 블록체인의 상태를 변경하는 것
## 2) GAS는 TX를 처리하는데 발생하는 비용
### 이때 소모되는 비용을 Gas Fee라 정의
### Gas Fee는 블록을 생성한 노드가 수집

# 3. 트랜잭션과 서명
## 플랫폼은 sender가 TX가 처리되는데 필요한 가스피를 가지고 있는지 확인
## TX 체결과 동시에 sender의 balance에서 가스피를 차감
## TX는 sender의 서명(v, r, s)이 필요
### 1) 어카운트의 balance를 사용하기 때문
### 2) 서명의 증명은 구현마다 상이
#### ETH) 서명 → 공개키 도출 → 어카운트 주소 도출 → 어카운트 존재유무 확인
#### KLAY) From 주소 확인 → 저장된 공개키 불러오기 → 서명 직접 검증

# 4. 스마트 컨트랙트
## 특정 주소에 배포된 TX로 실행 가능한 코드
### 스마트 컨트랙트 소스코드는 함수와 상태를 표현 : 컨트랙트 소스코드는 블록체인 내 저장
### 함수는 상태를 변경하는 함수, 상태를 변경하지 않는 함수로 분류
### 사용자가 스마트 컨트랙트 함수를 실행하거나 상태를 읽을 때 주소가 필요
## 스마트 컨트랙트는 사용자가 실행
### 상태 변경 함수를 실행하려면 그에 맞는 TX를 생성해 블록에 추가(TX 실행 = 함수의 실행)

# 5. Solidity
## ETH / KLAY의 스마트컨트랙트 언어
## 포인터의 개념이 없기 때문에 Recursive Type의 선언이 불가능

## Contract = Code + Data
### Solidity 컨트랙트 코드(함수)와 데이터(상태)로 구성
### Solidity 함수는 코드 안에 변수로 선언된 상태를 변경하거나 불러옴

# Solidity 소스코드 컴파일링
## solc - Solidity 컴파일러(소스코드는 배포에 앞서 EVM에서 실행되는 형태로 변환해야함) 

# BApp(Blockchain App)
## 블록체인 어플리케이션은 블록체인을 사용하는 앱
### 기존의 기술로 풀기 어려운 문제들을 블록체인 특성을 활용해 풀어내는 것이 목적
## 불변성과 투명성이 대표적인 블록체인의 특성
### 한번 기록된 정보는 변경 불가하고 정해진 규칙에 따라 상태를 변경
### 기록의 내역이 블록 공개이므로 누구든지 정보의 진실여부 확인 가능

# BApp들이 블록체인을 사용하는 유형
## As a Payment Channel
### 토큰을 사용한 결제
## As a Stroage
### 블록체인을 안전한 저장소로 인식
## As a World Computer
### 모든 노드가 동일한 연산을 수행
### 어느 한 노드에 의존하지 않는 탈중앙화된 실행 환경

# BApp의 유형
## Fully decentralized
### 사용자가 직접 블록체인과 통신
## Semi-decentralized with centralized proxy
### 클라이언트가 블록체인과 통신하기 위해 중개 서버와 통신
### 블록체인 기반으로 만들어진 서비스가 있고 그 서비스를 사용자들이 사용하는 형태
### 클라이언트 <-> 중개서버 <-> 블록체인

## Fully Decentralized
### 장점
#### 높은 투명성
#### 신뢰형성에 필요한 비용 없음
#### 경우에 따라 사용자 익명성 보장 가능
#### (설치형 BApp의 경우) 관리 비용 낮음

### 단점
#### 사용자 책임 증가, 어려운 UX
#### 로직 변경 어려움
#### 경우에 따라 사용자가 블록체인에 상시 접속할 필요 및 블록을 복제할 필요 있음

## Semi-decentralized with Centralized Proxy
### 장점
#### (기존의 서비스들과 동일한) 높은 수준의 UX
#### 사용자가 블록체인과 직접 통신할 필요 없음
#### 로직 변경 비교적 쉬움

### 단점
#### 신뢰비용 발생
#### 서비스가 Single Point of Failure(SPoF)가 됨
#### 관리 비용 높음

# BApp 개발
## 프론트엔드
### 사용자가 직접 사용하는 프로그램
### UI, 통신, 이벤트 처리 등을 사용자 환경을 고려해 개발
### TX 생성, 서명, 전송 등을 프론트엔드에서 처리
### BApp이 실행되는 환경에 따라 개발 방법이 달라짐
#### 실행환경: Web, Mobile, Native(Win,Linux)
#### 어느 환경에서 개발하냐에 따라 개발 언어와 UI/UX 디자인, 사용 SDK가 달라짐
#### KLAY는 Javascript, Java(Android, Native) SDK를 제공
#### Java는 Android, Native(with JRE)에서 사용
### 프론트엔드 개발에 영향을 끼치는 실행환경 중 하나가 지갑
#### 지갑의 존재 유무에 따라 개발방법이 변경
#### 특정지갑을 사용할 경우 해당 지갑이 제공하는 라이브러리를 사용

## 백엔드
### 프론트엔드가 사용자 요청을 전달하면 백엔드가 처리하는 구조
### 블록체인 동기화 등 컴퓨팅 리소스가 많이 필요한 일을 처리하는데 적합
### 블록체인 동기화, 블록 파싱, TX 전달, 가스비 대납 등을 백엔드에서 처리

# 지갑
## TX를 서명하려면 키가 필요
### 키 -> 어카운트
### 서로 다른 키는 다른 어카운트에 매핑
### 하나의 어카운트로 여러 BApp을 사용하려는 사용자의 니즈가 존재

## 지갑 = 키를 관리하는 프로그램
### 키를 보관하고 BApp이 요청할 때마다 보관 중인 키로 TX를 서명
### 여러 유형의 지갑이 존재
#### 브라우저 플러그인, Dapp 브라우저 내장 지갑, 클라우드 지갑, 디바이스 지갑

# 지갑을 고려한 BApp 개발
## 어떤 지갑을 사용하느냐에 따라 사용자 환경이 변화
### 어떤 형태로 BApp을 만들건지? 웹앱? 모바일 웹? 모바일 네이티브? 데스크탑?
### 외부 지갑을 쓸 경우 개발하려는 BApp 형태와 맞는 지갑이 어떤 것인지?
#### 웹앱의 경우 Metmask를 사용
#### 모바일 웹 / 네이티브의 경우 삼성 블록체인 키스토어 사용

# 백엔드
## 블록체인 프로토콜 이외의 정보를 관리할 경우 필요
### UX 향상 및 서비스 구현을 위해 TX 외 다른 정보가 필요한 경우 백엔드 운영
### e.g. 문서공증 BApp
#### 사용자가 문서공증을 위해 BApp을 사용
#### 문서의 해시를 포함한 공증기록은 블록체인에 기록
#### 정보의 누설을 원치 않을 경우 문서 원본은 블록체인에 기록하기 어려움
#### 문서를 클라이언트에 보관할 순 있으나 분실 위험, 여러 장치에서 접근할 수 없는 문제
#### 백엔드에서 안전하게 원본 문서를 관리해 편리한 서비스 구현 가능
## 서비스 제공자가 실행환경을 결정
### 개발방법 선택이 비교적 자유로운 편이나 대부분 경우 플랫폼 SDK 존재유무에 따라 방향을 결정

# 블록체인의 문제
## 성능
#### 한 블록이 담을 수 있는 트랜잭션 개수 제한
#### 주기적인 블록 합의로 인해 발생하는 지연
## 비용
#### 합의에 참여하기 위해 필요한 비용
#### 블록을 유지하기 위해 필요한 비용
## 불편함
#### 사용자가 가스비를 내야하는 불편함
#### 사용자가 직접 키를 관리해야하는 불편함

# Klaytn의 해결법
## 성능
#### 4000 TPS / 1초 블록생성 주기
## 비용
#### 대기업 참여 / KAS
## 불편함
#### 가스비 대납 기능 구현 / 키 관리 체계 구현

# 가스비가 UX에 미치는 영향
## TX를 처리하는데 필요한 자원을 비용으로 전환한 것이 가스
#### 플랫폼 사용료
#### EVM 명령어마다 정해진 가스량이 존재
#### Sender는 (TX의 처리를 위해 필요한 가스 총량) X (Gas Price)만큼의 KLAY를 제공
## 복잡한 연산을 수행할 수록 높은 가스비가 소모
#### Klaytn의 Gas Price는 25 ston/gas (0.00000025 KLAY로 고정)
#### KLAY 전송에 필요한 가스비는 0.000525 KLAY (21,000 gas)
#### Count 컨트랙트를 배포하는데 약 183,000 gas가 필요

## 문제점 정리
#### 사용자는 플랫폼 사용료를 지불하는 것을 이해 못함
#### 사용하는 서비스가 KCT(Klaytn Compatible Token)를 사용할 경우 더욱 그러함
#### 사용자가 KLAY를 취득하기 어려움
#### 법정화페(fiat)로 가상자산을 취득하는 것이 어려움
#### 어플리케이션 최초 사용 시나리오에서 큰 장애물로 작용