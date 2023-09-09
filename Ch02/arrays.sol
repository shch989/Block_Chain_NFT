// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

contract learnArrays {
    // 동적 배열 myArray 선언
    uint[] public myArray;
    
    // 다른 동적 배열 myArray2 선언
    uint[] public myArray2;
    
    // 고정 크기 배열 myFixedSizedArray 선언 (200개 요소)
    uint[200] public myFixedSizedArray;

    // 동적 배열 changeArray 선언
    uint[] public changeArray;

    // 배열에 요소 추가하는 함수
    function push(uint number) public {
        myArray.push(number);
    }

    // 배열의 마지막 요소 제거하는 함수
    function pop() public {
        myArray.pop();
    }

    // 배열의 길이를 조회하는 함수
    function getlength() public view returns (uint) {
        return myArray.length;
    }

    // 배열에서 특정 위치의 요소 제거하는 함수
    function remove(uint i) public {
        delete myArray[i];
    }

    // 배열에서 특정 위치의 요소를 다른 위치로 옮기고 제거하는 함수
    function removeElement(uint i) public {
        changeArray[i] = changeArray[changeArray.length - 1];
        changeArray.pop();
    }

    // 테스트용으로 배열에 요소 추가하는 함수
    function test() public {
        for (uint i = 1; i <= 4; i++) {
            changeArray.push(i);
        }
    }

    // changeArray 배열을 조회하는 함수
    function getChangeArray() public view returns (uint[] memory) {
        return changeArray;
    }
}