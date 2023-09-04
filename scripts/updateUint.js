// Web3.js를 사용하여 Ethereum 스마트 계약과 상호작용하는 비동기 함수 시작
(async () => {
    // 스마트 계약의 주소
    const address = "0xd8b934580fcE35a11B58C6D73aDeE468a2833fa8";
    
    // 스마트 계약의 ABI (Application Binary Interface) 배열
    const abiArray = [
        // 스마트 계약의 함수 정보와 데이터 형식을 포함한 객체들의 배열
        // 예제에서는 'myUint'와 'setMyUint' 함수가 포함되어 있습니다.
        {
            "inputs": [],
            "name": "myUint",
            "outputs": [
                {
                    "internalType": "uint256",
                    "name": "",
                    "type": "uint256"
                }
            ],
            "stateMutability": "view",
            "type": "function"
        },
        {
            "inputs": [
                {
                    "internalType": "uint256",
                    "name": "newUint",
                    "type": "uint256"
                }
            ],
            "name": "setMyUint",
            "outputs": [],
            "stateMutability": "nonpayable",
            "type": "function"
        }
    ];

    // 스마트 계약의 ABI와 주소를 사용하여 웹3(Web3.js) 객체를 생성합니다.
    const contractInstance = new web3.eth.Contract(abiArray, address);

    // 스마트 계약의 'myUint' 함수를 호출하여 스마트 계약의 상태를 읽어옵니다.
    console.log(await contractInstance.methods.myUint().call());

    // Ethereum 네트워크에서 사용 가능한 계정 목록을 가져옵니다.
    let accounts = await web3.eth.getAccounts();

    // 'setMyUint' 함수를 호출하여 스마트 계약의 상태를 변경합니다.
    // 'send' 메서드를 사용하여 트랜잭션을 전송하고, 호출한 계정으로부터 수행합니다.
    let txResult = await contractInstance.methods.setMyUint(345).send({from: accounts[0]});

    // 변경된 스마트 계약의 'myUint' 함수를 호출하여 변경된 상태를 읽어옵니다.
    console.log(await contractInstance.methods.myUint().call());

    // 트랜잭션 결과를 출력합니다.
    console.log(txResult);
})();