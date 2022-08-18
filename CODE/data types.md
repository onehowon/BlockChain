# Data Types
## Solidity는 다음과 같은 자료형(Data Types)을 지원
## Booleans(bool)

## Integers(int/int8/int16/... uint256/ uint)

## Address : 어카운트 주소를 표현(Klaytn 주소 길이는 20 바이트; addresss = byte20 형변환 가능)
### address private = address(O)
### address => address payable(X); uint160을 거쳐서만 가능
### Fixed-size byte arrays

### Reference Types
#### uint x = 10;
#### uint y = x;
#### string memory s = "Hello, world";
#### string memory t = s;
### structs, arrays, mapping과 같이 크기가 정해지지 않은 데이터를 위해 사용
### Value Type들은 변수끼리 대입할 경우 값을 복사
### Reference Type들은(같은 영역을 사용하는) 변수끼리 대입할 경우 같은 값을 참조
### 데이터는 저장되는 위치를 반드시 명시
#### memory(함수 내에서 유효한 영역에 저장)
#### storage(state variables와 같이 영속적으로 저장되는 영역에 저장)
#### calldata(external 함수 인자에 사용되는 공간)
#### 서로 다른 영역을 참조하는 변수 간 대입이 발생 시 데이터 복사
##### storage -> memory // calldata
##### anything => storage

## Arrays
### Javascript에서 배운 배열과 개념은 같으나 사용법이 상이
### State Variable로 사용할 때 (i.e. 저장공간 = storage)
#### T[k] x; => k개의 T를 가진 배열 x를 선언
#### e.g., uint[5] arr; => arr은 5개를 uint를 가진 배열;arr[0] => 첫번째 uint
#### T[] x; => x는 T를 담을 수 있는 배열; X의 크기는 변할 수 있음(dynamic size)
#### T[][k] x; => k개의 T를 담을 수 있는 dynamic size 배열 x를 선언
#### T[][k] x가 주어질 때 x[i][j]는 (i-1)번째 배열의 (j-1)번째 T를 불러옴
#### 모든 유형의 데이터를 배열에 담을 수 있음(mapping, struct 포함)

## More on Arrays
### push(T item) and .length
### push(T item)은 배열에 데이터를 추가
### .length는 배열 크기를 반환
### 런타임에 생성되는 (i.e., 함수 내에서) memory 배열은 new 키워드를 써서 선언
### storage 배열과 달리 memory 배열은 dynamic array 사용이 불가

## Mapping Types
### mapping( K => V) table;
#### 해시테이블과 유사, 배열처럼 사용
#### storage 영역에만 저장 가능
#### 함수 인자, 또는 public 리턴 값으로 사용 불가
## Contract Types
