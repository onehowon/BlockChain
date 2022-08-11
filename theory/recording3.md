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