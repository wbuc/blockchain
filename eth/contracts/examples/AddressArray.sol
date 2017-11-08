pragma solidity ^0.4.15;

contract AddressArray {

    address[] addresses;

    function AddressArray(uint intValue1, address[] addresses_, uint intValue2) {
        for (uint i = 0; i < addresses_.length; i++) {
            addresses.push(addresses_[i]);
        }
    }

    function getNumberOfAddresses() constant returns (uint) {
        return addresses.length;
    }

    function getAddress(uint i) constant returns (address) {
        return addresses[i];
    }
}

/*
Constructor sample: 123, ["0xca35b7d915458ef540ade6068dfe2f44e8fa733c", "0x583031d1113ad414f02576bd6afabfb302140225"], 456
*/
