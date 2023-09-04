// Web3.js를 사용하여 Ethereum과 상호작용하는 비동기 함수 시작
(async () => {
    // Ethereum 네트워크에 연결된 모든 계정 목록을 가져옵니다.
    let accounts = await web3.eth.getAccounts();
    console.log(accounts, accounts.length);

    // 첫 번째 계정의 잔액을 Wei 단위로 가져옵니다.
    let balance = await web3.eth.getBalance(accounts[0]);
    console.log(balance);

    // 잔액을 Ethereum (ETH) 단위로 변환합니다.
    let balanceInEth = await web3.utils.fromWei(balance, "ether");
    console.log(balanceInEth);
})();