// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0 < 0.9.0;

interface ProvableI {
    function setProofType(bytes1 _proofType) external;
    function setCustomGasPrice(uint _gasPrice) external;
    function cbAddress() external returns (address _cbAddress);
    function randomDS_getSessionPubKeyHash() external view returns (bytes32 _sessionKeyHash);

    function getPrice(
        string calldata _datasource
    ) external returns (uint _dsprice);

    function getPrice(
        string calldata _datasource,
        uint _gasLimit
    )  external returns (uint _dsprice);

    function queryN(
        uint _timestamp,
        string calldata _datasource,
        bytes calldata _argN
    ) external payable returns (bytes32 _id);

    function query(
        uint _timestamp,
        string calldata _datasource,
        string calldata _arg
    ) external payable returns (bytes32 _id);

    function query2(
        uint _timestamp,
        string calldata _datasource,
        string calldata _arg1,
        string calldata _arg2
    ) external payable returns (bytes32 _id);

    function query_withGasLimit(
        uint _timestamp,
        string calldata _datasource,
        string calldata _arg,
        uint _gasLimit
    ) external payable returns (bytes32 _id);

    function queryN_withGasLimit(
        uint _timestamp,
        string calldata _datasource,
        bytes calldata _argN,
        uint _gasLimit
    ) external payable returns (bytes32 _id);

    function query2_withGasLimit(
        uint _timestamp,
        string calldata _datasource,
        string calldata _arg1,
        string calldata _arg2,
        uint _gasLimit
    ) external payable returns (bytes32 _id);
}
