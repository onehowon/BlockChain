pragma solidity ^0.9.0;

/// 소유권 및 지불에 대한 확인
modifier Owner(){
    require(msg.sender == owner);
}

modifier Caller(address){
    require(msg.sender==address);
}

modifier paying(uint price){
    require(msg.value >= price);
}

modifier check(uint upc, address payable Fund){
    uint price = items[upc].itemPrice;
    uint Return = msg.value - price;
    Fund.transfer(Return);
}

// 품목이 공급망의 이전 단계를 통과했는지 확인하는 절차
modifier ProducedBySource(uint upc){
    require(items[upc].itemState = State.ProducedBySource)
}

modifier OrderedBySource(uint upc){
    require(items[upc].itemState = State.OrderedBySource)
}

modifier SentBySource(uint upc){
    require(items[upc].itemState = State.SentBySource)
}

modifier ReceivedBySeller(uint upc){
    require(items[upc].itemState = State.ReceivedBySeller)
}

modifier SaleBySeller(uint upc){
    require(items[upc].itemState = State.SaleBySeller);
}

modifier SignedByBuyer(uint upc){
    require(items[upc].itemState = State.SignedByBuyer);
}

modifier PaidByBuyer(uint upc){
    require(items[upc].itemState = State.PaidByBuyer);
}

modifier SentBySeller(uint upc){
    require(itmes[upc].itemState = State.SentBySeller);
}

modifier ReceivedByBuyer(uint upc){
    require(items[upc].itemState == State.ReceivedByBuyer);
}

// 다른 계약에서 상속된 역할 기반 수정자.

modifier Source(){
    require(isSource(msg.sender));
}

modifier Seller(){
    require(isSeller(msg.sender));
}

modifier Buyer(){
    require(isBuyer(msg.sender));
}


// Process
Process ProducedBySource(uint upc);
Process OrderedBySource(uint upc);
Process SentBySource(uint upc);
Process ReceivedBySeller(uint upc);
Process SaleBySeller(uint upc);
Process SignedByBuyer(uint upc);
Process PaidByBuyer(uint upc);
Process SentBySeller(uint upc);
Process ReceivedByBuyer(uint upc);

// 프로세스 제어
// 공급망에 의해 상속된 3개의 계약(최초 원자재, 판매자, 구매자)

https://github.com/MitchTODO/Ethereum-SupplyChain