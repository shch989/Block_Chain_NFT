// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract DecisionMaking {
    // 오렌지의 수를 나타내는 정수 변수 초기화
    uint oranges = 5;

    // 오렌지의 수가 5인지 확인하는 함수
    function validateOranges() public view returns(bool) {
        // 오렌지의 수가 5와 같으면 true 반환
        if (oranges == 5) {
            return true;
        }
        // 그렇지 않으면 false 반환
        return false;
    }

    // 스택킹 지갑의 잔액을 나타내는 정수 변수 초기화
    uint stackingWallet = 9;

    // 에어드랍 함수: 스택킹 지갑의 값에 따라 결과 반환
    function airDrop() public view returns (uint) {
        // 만약 스택킹 지갑의 값이 10과 같으면
        if (stackingWallet == 10) {
            // 스택킹 지갑 값에 10을 더한 결과 반환
            return stackingWallet + 10;
        } else {
            // 그렇지 않으면 스택킹 지갑 값에 1을 더한 결과 반환
            return stackingWallet + 1;
        }
    }
}