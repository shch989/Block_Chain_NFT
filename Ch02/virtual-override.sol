// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// X 계약 정의
contract X {
    // 가상 함수 "y" 선언
    function y() public view virtual returns (string memory) {
        // 이 함수는 구현 내용이 없습니다.
        // 하위 계약에서 재정의할 것을 기대합니다.
    }
}

// Z 계약은 X 계약을 상속받습니다.
contract Z is X {
    // X 계약에서 상속받은 "y" 함수를 재정의합니다.
    function y() public view override returns (string memory) {
        // "hello" 문자열 반환
        return "hello";
    }
}
