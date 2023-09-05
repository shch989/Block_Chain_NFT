// SPDX-License-Identifier: MIT
// pragma solidity 0.8.16;

contract EventExample {
    // 사용자 주소에 대한 토큰 잔액을 저장하는 매핑
    mapping(address => uint) public tokenBalance;

    // 토큰 전송 이벤트 정의
    event TokensSent(address _from, address _to, uint _amount);

    // 생성자: 계약을 배포할 때 초기 토큰 잔액을 계약 소유자에게 할당합니다.
    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    // 토큰을 다른 주소로 전송하는 함수
    function sendToken(address _to, uint _amount) public returns(bool) {
        // 전송자의 잔액이 충분한지 확인합니다.
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");

        // 전송자의 잔액을 감소시키고 수신자의 잔액을 증가시킵니다.
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;

        // 토큰 전송 이벤트를 발생시킵니다.
        emit TokensSent(msg.sender, _to, _amount);

        // 전송이 성공적으로 이루어졌음을 나타내는 부울 값을 반환합니다.
        return true;
    }
}