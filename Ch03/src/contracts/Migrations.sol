// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

// 마이그레이션 관련 작업을 수행하는 스마트 계약 "Migrations" 정의
contract Migrations {
  address public owner = msg.sender; // 계약 소유자의 주소
  uint public last_completed_migration; // 마지막으로 완료된 마이그레이션 버전

  // 함수 제한자: 호출자가 계약 소유자인 경우에만 실행 가능
  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner!"
    );
    _; // 다음 코드 블록 실행
  }

  // 마이그레이션 완료 상태를 설정하는 함수
  function setCompleted(uint completed) public restricted {
    last_completed_migration = completed; // 마지막 완료된 마이그레이션 버전 업데이트
  }

  // 계약 업그레이드를 수행하는 함수
  function upgrade(address new_address) public restricted {
    // 새로운 계약 주소에 대한 인스턴스 생성
    Migrations upgraded = Migrations(new_address);
    // 마지막으로 완료된 마이그레이션 버전을 새로운 계약에 설정
    upgraded.setCompleted(last_completed_migration);
  }
}