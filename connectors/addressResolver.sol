/*
Copyright (c) 2015-2016 Oraclize srl, Thomas Bertani
*/

contract OraclizeAddrResolver {

    address public addr;
    
    address owner;
    
    function OraclizeAddrResolver(){
        owner = msg.sender;
    }
    
    
    function getAddress() returns (address oaddr){
        return addr;
    }
    
    function setAddr(address newaddr){
        if (msg.sender != owner) throw;
        addr = newaddr;
    }
    
}                                            
