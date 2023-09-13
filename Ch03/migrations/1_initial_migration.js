const Migrations = artifacts.require("Migrations"); // 배포할 스마트 계약의 ABI 파일을 가져옵니다.

module.exports = function (deployer) {
  deployer.deploy(Migrations); // Migrations 스마트 계약을 배포합니다.
};
