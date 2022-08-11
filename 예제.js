const Caver = require('caver-js');
const caver = new Caver('https://api.baobab.klaytn.net:8651/');
//getBlocknumber() returns a Promise object returning Number

caver.klay.getBlockNumber(function(err, blockNumber) {
    console.log(blockNumber);
});

//alternatively
caver.klay.getBlockNumber().then(console.log);

const account = caver.klay.accounts.create();
// in - memory wallet
const wallet = caver.klay.accounts.wallet;
wallet.add(account);
console.log(wallet.length); // wallet에 저장된 어카운트 개수를 확인
console.log(wallet[account.address]); // 해당 주소를 가지는 어카운트를 불러옴; 없을 경우 undefined
console.log(wallet[0]); // 저장된 첫번째 어카운트를 불러옴; 없을 경우 undefined

wallet.clear(); wallet.create(2); // in-memory 초기화 & 어카운트 2개 생성
const tx = {
    type: "VALUE_TRANSFER", from:wallet[0].address, to: wallet[1].address, // type, sender, recipient
    value: caver.utils.toPeb('1', 'KLAY'), // 1KLAY 전송
    gas: 300000 // TX가 사용할 수 있는 가스총량
};

// 첫번째 어카운트의 비밀키로 서명

caver.klay.accounts.signTransaction(tx, wallet[0].privateKey).then(console.log);

/// 서명된 TX 전송
const tx = { ... };
(async () => {
    const signedTransaction = await caver.klay.accounts.signTransaction(tx, sender.privateKey);
    await caver.klay.sendSignedTransaction(signedTransaction.rawTransaction)
    .on('transactionHash', function(txhash) { console.log('hash first', txhash);})
    .on('receipt', function(receipt) {console.log('receipt later', receipt);})
    .on('error', function(err){console.error('something went wrong');})
})();

// 스마트컨트랙트 배포

// 예제의 본 SimpleStorage 컨트랙트의 ABI와 Bytecode를 사용
const abi = [...];
const contract = new caver.klay.Contract(abi);
contract.deploy({ data: '6080604052348015...0029'})
    .send({from: wallet[1].address,
          gas: 3000000,
          value: 0})
    .on('receipt', function(receipt){
    	// 컨트랙트 주소가 receipt에 포함
    	console.log('contract deployed at', receipt.contractAddress);
})

// 스마트 컨트랙트 함수 실행
const contract = new caver.klay.Contract(abi, '0x20e199c44768F2C39Cb771D2F96B13fE6D63a411');
contract.methods.set(100) // SimpleStorage의 set함수를 실행; 상태를 바꾸는 함수이기에 tx로 실행
    	.send({
    		from: wallet[1].address,
    		gas: 300000
})
    	.on('error', function(hash){})
    	.on('transactionHash', function(hash){})
    	.on('receipt', function(receipt){});
