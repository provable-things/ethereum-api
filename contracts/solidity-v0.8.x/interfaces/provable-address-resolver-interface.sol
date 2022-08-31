// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.0 < 0.9.0;

interface OracleAddrResolverI {
    function getAddress() external returns (address _address);
}
