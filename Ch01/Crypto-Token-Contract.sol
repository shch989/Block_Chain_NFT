// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract CryptoToken {
    // 토큰 발행자의 주소를 저장하는 변수
    address public minter;

    // 사용자 주소별 토큰 잔액을 저장하는 매핑
    mapping (address => uint) public balances;

    // 토큰 전송 이벤트 정의
    event Sent(address from, address to, uint amount);
    
    // 생성자: 계약을 배포한 사람을 토큰 발행자로 설정
    constructor() {
        minter = msg.sender;
    }

    // 토큰을 발행하는 함수
    function mint(address receiver, uint amount) public {
        // 발행자만이 토큰을 발행할 수 있도록 제한
        require(msg.sender == minter);

        // 수신자의 토큰 잔액을 증가시킴
        balances[receiver] += amount;
    }

    // 토큰을 전송하는 함수
    function send(address receiver, uint amount) public {
        // 전송자의 토큰 잔액을 감소시키고 수신자의 토큰 잔액을 증가시킴
        balances[msg.sender] -= amount;
        balances[receiver] += amount;

        // 토큰 전송 이벤트를 발생시킴
        emit Sent(msg.sender, receiver, amount);
    }
}