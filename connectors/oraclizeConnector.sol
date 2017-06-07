/*
Copyright (c) 2015-2016 Oraclize SRL
Copyright (c) 2016 Oraclize LTD
*/

/*
Oraclize Connector v1.1.0
*/

pragma solidity ^0.4.11;

contract Oraclize {
    mapping (address => uint) reqc;

    mapping (address => byte) public cbAddresses;

    event Log1(address sender, bytes32 cid, uint timestamp, string datasource, string arg, uint gaslimit, byte proofType, uint gasPrice);
    event Log2(address sender, bytes32 cid, uint timestamp, string datasource, string arg1, string arg2, uint gaslimit, byte proofType, uint gasPrice);
    event LogN(address sender, bytes32 cid, uint timestamp, string datasource, bytes args, uint gaslimit, byte proofType, uint gasPrice);
    event Log1_fnc(address sender, bytes32 cid, uint timestamp, string datasource, string arg, function() external callback, uint gaslimit, byte proofType, uint gasPrice);
    event Log2_fnc(address sender, bytes32 cid, uint timestamp, string datasource, string arg1, string arg2, function() external callback, uint gaslimit, byte proofType, uint gasPrice);
    event LogN_fnc(address sender, bytes32 cid, uint timestamp, string datasource, bytes args, function() external callback, uint gaslimit, byte proofType, uint gasPrice);

    address owner;

    modifier onlyadmin {
        if (msg.sender != owner) throw;
       _;
    }
    
    function changeAdmin(address _newAdmin) 
    onlyadmin {
        owner = _newAdmin;
    }

    // proof is currently a placeholder for when associated proof for addressType is added
    function addCbAddress(address newCbAddress, byte addressType, bytes proof) 
    onlyadmin {
        cbAddresses[newCbAddress] = addressType;
    }

    function addCbAddress(address newCbAddress, byte addressType)
    onlyadmin {
        bytes memory nil = '';
        addCbAddress(newCbAddress, addressType, nil);
    }

    function removeCbAddress(address newCbAddress)
    onlyadmin {
        delete cbAddresses[newCbAddress];
    }

    function cbAddress()
    constant
    returns (address _cbAddress) {
        if (cbAddresses[tx.origin] != 0)
            _cbAddress = tx.origin;
    }

    function addDSource(string dsname, uint multiplier) {
        addDSource(dsname, 0x00, multiplier);
    }

    function addDSource(string dsname, byte proofType, uint multiplier) onlyadmin {
        bytes32 dsname_hash = sha3(dsname, proofType);
        dsources[dsources.length++] = dsname_hash;
        price_multiplier[dsname_hash] = multiplier;
    }

    function multisetProofType(uint[] _proofType, address[] _addr) onlyadmin {
        for (uint i=0; i<_addr.length; i++) addr_proofType[_addr[i]] = byte(_proofType[i]);
    }

    function multisetCustomGasPrice(uint[] _gasPrice, address[] _addr) onlyadmin {
        for (uint i=0; i<_addr.length; i++) addr_gasPrice[_addr[i]] = _gasPrice[i];
    }

    uint gasprice = 20000000000;

    function setGasPrice(uint newgasprice)
    onlyadmin {
        gasprice = newgasprice;
    }

    function setBasePrice(uint new_baseprice)
    onlyadmin { //0.001 usd in ether
        baseprice = new_baseprice;
        for (uint i=0; i<dsources.length; i++) price[dsources[i]] = new_baseprice*price_multiplier[dsources[i]];
    }

    function setBasePrice(uint new_baseprice, bytes proofID)
    onlyadmin { //0.001 usd in ether
        baseprice = new_baseprice;
        for (uint i=0; i<dsources.length; i++) price[dsources[i]] = new_baseprice*price_multiplier[dsources[i]];
    }

    function withdrawFunds(address _addr)
    onlyadmin {
        _addr.send(this.balance);
    }

    function() onlyadmin {}

    function Oraclize() {
        owner = msg.sender;
    }

    modifier costs(string datasource, uint gaslimit) {
        uint price = getPrice(datasource, gaslimit, msg.sender);
        if (msg.value >= price){
            uint diff = msg.value - price;
            if (diff > 0) msg.sender.send(diff);
           _;
        } else throw;
    }

    mapping (address => byte) addr_proofType;
    mapping (address => uint) addr_gasPrice;
    uint public baseprice;
    mapping (bytes32 => uint) price;
    mapping (bytes32 => uint) price_multiplier;
    bytes32[] dsources;

    bytes32[] public randomDS_sessionPubKeysHash;

    function randomDS_updateSessionPubKeysHash(bytes32[] _newSessionPubKeysHash) onlyadmin {
        randomDS_sessionPubKeysHash.length = 0;
        for (uint i=0; i<_newSessionPubKeysHash.length; i++) randomDS_sessionPubKeysHash.push(_newSessionPubKeysHash[i]);
    }

    function randomDS_getSessionPubKeyHash() constant returns (bytes32) {
        uint i = uint(sha3(reqc[msg.sender]))%randomDS_sessionPubKeysHash.length;
        return randomDS_sessionPubKeysHash[i];
    }

    function setProofType(byte _proofType) {
        addr_proofType[msg.sender] = _proofType;
    }

    function setCustomGasPrice(uint _gasPrice) {
        addr_gasPrice[msg.sender] = _gasPrice;
    }

    function getPrice(string _datasource)
    public
    returns (uint _dsprice) {
        return getPrice(_datasource, msg.sender);
    }

    function getPrice(string _datasource, uint _gaslimit)
    public
    returns (uint _dsprice) {
        return getPrice(_datasource, _gaslimit, msg.sender);
    }

    function getPrice(string _datasource, address _addr)
    private
    returns (uint _dsprice) {
        return getPrice(_datasource, 200000, _addr);
    }

    function getPrice(string _datasource, uint _gaslimit, address _addr)
    private
    returns (uint _dsprice) {
        uint gasprice_ = addr_gasPrice[_addr];
        if ((_gaslimit <= 200000)&&(reqc[_addr] == 0)&&(gasprice_ <= gasprice)&&(tx.origin != cbAddress())) return 0;
        if (gasprice_ == 0) gasprice_ = gasprice;
        _dsprice = price[sha3(_datasource, addr_proofType[_addr])];
        _dsprice += _gaslimit*gasprice_;
        return _dsprice;
    }

    function getCodeSize(address _addr)
    private
    constant
    returns(uint _size) {
    assembly {
        _size := extcodesize(_addr)
        }
    }

    function query(string _datasource, string _arg)
    payable
    returns (bytes32 _id) {
        return query1(0, _datasource, _arg, 200000);
    }

    function query1(string _datasource, string _arg)
    payable
    returns (bytes32 _id) {
        return query1(0, _datasource, _arg, 200000);
    }

    function query2(string _datasource, string _arg1, string _arg2)
    payable
    returns (bytes32 _id) {
        return query2(0, _datasource, _arg1, _arg2, 200000);
    }

    function queryN(string _datasource, bytes _args)
    payable
    returns (bytes32 _id) {
        return queryN(0, _datasource, _args, 200000);
    }

    function query(uint _timestamp, string _datasource, string _arg)
    payable
    returns (bytes32 _id) {
        return query1(_timestamp, _datasource, _arg, 200000);
    }

    function query1(uint _timestamp, string _datasource, string _arg)
    payable
    returns (bytes32 _id) {
        return query1(_timestamp, _datasource, _arg, 200000);
    }

    function query2(uint _timestamp, string _datasource, string _arg1, string _arg2)
    payable
    returns (bytes32 _id) {
        return query2(_timestamp, _datasource, _arg1, _arg2, 200000);
    }

    function queryN(uint _timestamp, string _datasource, bytes _args)
    payable
    returns (bytes32 _id) {
        return queryN(_timestamp, _datasource, _args, 200000);
    }

    function query(uint _timestamp, string _datasource, string _arg, uint _gaslimit)
    payable
    returns (bytes32 _id) {
        return query1(_timestamp, _datasource, _arg, _gaslimit);
    }

    function query_withGasLimit(uint _timestamp, string _datasource, string _arg, uint _gaslimit)
    payable
    returns (bytes32 _id) {
        return query(_timestamp, _datasource, _arg, _gaslimit);
    }

    function query1_withGasLimit(uint _timestamp, string _datasource, string _arg, uint _gaslimit)
    payable
    returns (bytes32 _id) {
        return query1(_timestamp, _datasource, _arg, _gaslimit);
    }

    function query2_withGasLimit(uint _timestamp, string _datasource, string _arg1, string _arg2, uint _gaslimit)
    payable
    returns (bytes32 _id) {
        return query2(_timestamp, _datasource, _arg1, _arg2, _gaslimit);
    }

    function queryN_withGasLimit(uint _timestamp, string _datasource, bytes _args, uint _gaslimit)
    payable
    returns (bytes32 _id) {
        return queryN(_timestamp, _datasource, _args, _gaslimit);
    }

    function query1(uint _timestamp, string _datasource, string _arg, uint _gaslimit) costs(_datasource, _gaslimit)
    payable
    returns (bytes32 _id) {
    	if ((_timestamp > now+3600*24*60)||(_gaslimit > block.gaslimit)) throw;

        _id = sha3(this, msg.sender, reqc[msg.sender]);
        reqc[msg.sender]++;
        Log1(msg.sender, _id, _timestamp, _datasource, _arg, _gaslimit, addr_proofType[msg.sender], addr_gasPrice[msg.sender]);
        return _id;
    }

    function query2(uint _timestamp, string _datasource, string _arg1, string _arg2, uint _gaslimit)
    costs(_datasource, _gaslimit)
    payable
    returns (bytes32 _id) {
    	if ((_timestamp > now+3600*24*60)||(_gaslimit > block.gaslimit)) throw;

        _id = sha3(this, msg.sender, reqc[msg.sender]);
        reqc[msg.sender]++;
        Log2(msg.sender, _id, _timestamp, _datasource, _arg1, _arg2, _gaslimit, addr_proofType[msg.sender], addr_gasPrice[msg.sender]);
        return _id;
    }

    function queryN(uint _timestamp, string _datasource, bytes _args, uint _gaslimit) costs(_datasource, _gaslimit)
    payable
    returns (bytes32 _id) {
    	if ((_timestamp > now+3600*24*60)||(_gaslimit > block.gaslimit)) throw;

        _id = sha3(this, msg.sender, reqc[msg.sender]);
        reqc[msg.sender]++;
        LogN(msg.sender, _id, _timestamp, _datasource, _args, _gaslimit, addr_proofType[msg.sender], addr_gasPrice[msg.sender]);
        return _id;
    }

    function query1_fnc(uint _timestamp, string _datasource, string _arg, function() external _fnc, uint _gaslimit)
    costs(_datasource, _gaslimit)
    payable
    returns (bytes32 _id) {
        if ((_timestamp > now+3600*24*60)||(_gaslimit > block.gaslimit)||address(_fnc) != msg.sender) throw;

        _id = sha3(this, msg.sender, reqc[msg.sender]);
        reqc[msg.sender]++;
        Log1_fnc(msg.sender, _id, _timestamp, _datasource, _arg, _fnc, _gaslimit, addr_proofType[msg.sender], addr_gasPrice[msg.sender]);
        return _id;
    }

    function query2_fnc(uint _timestamp, string _datasource, string _arg1, string _arg2, function() external _fnc, uint _gaslimit)
    costs(_datasource, _gaslimit)
    payable
    returns (bytes32 _id) {
        if ((_timestamp > now+3600*24*60)||(_gaslimit > block.gaslimit)||address(_fnc) != msg.sender) throw;

        _id = sha3(this, msg.sender, reqc[msg.sender]);
        reqc[msg.sender]++;
        Log2_fnc(msg.sender, _id, _timestamp, _datasource, _arg1, _arg2, _fnc,  _gaslimit, addr_proofType[msg.sender], addr_gasPrice[msg.sender]);
        return _id;
    }

    function queryN_fnc(uint _timestamp, string _datasource, bytes _args, function() external _fnc, uint _gaslimit)
    costs(_datasource, _gaslimit)
    payable
    returns (bytes32 _id) {
        if ((_timestamp > now+3600*24*60)||(_gaslimit > block.gaslimit)||address(_fnc) != msg.sender) throw;

        _id = sha3(this, msg.sender, reqc[msg.sender]);
        reqc[msg.sender]++;
        LogN_fnc(msg.sender, _id, _timestamp, _datasource, _args, _fnc, _gaslimit, addr_proofType[msg.sender], addr_gasPrice[msg.sender]);
        return _id;
    }
}
