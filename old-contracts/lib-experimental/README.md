### Experimental Oraclize API Library implementation

A library version of the oraclize API, allowing for much lower deployment gas costs of contracts leveraging Oraclize.

Some features might be missing, like the helpers for the [randomDS](http://docs.oraclize.it/#data-sources-random), so if you need to use those please refer to the standard [oraclizeAPI](https://github.com/oraclize/ethereum-api) instead.

#### Notes

Following data is applicable to a previous iteration of the library but should still produce similar results.

For the contract examples, they will not work with Javascript VM in browser-solidity due to some incompatibility of the VM with libraries. It will work fine with ganache, privatenets, testnets, mainnet.

In the future, we will look to provide an already deployed library, which you may link your contracts to.

#### Comparison

(N.B. this is data from the previous version, but should still be applicable)

Comparison of `KrakenPriceTicker.sol` deployment cost differences:

* Regular Unoptimized
> 1,867,173  gas
* with Library Unoptimized  
> 733,111 gas
* Regular Optimized
> 1,429,716  gas
* with Library Optimized  
> 712,380 gas

As these figures show, it can save up to 50-60% of a contract's deployment costs. It is important to note, that the library will be deployed separately, and its optimized deployment gas cost is almost 3M. It is still very useful in a singular contract basis, if you wish to keep all code within a single contract, as it will allow that singular contract to stay under the network's gas limit. Where the library really shines is in the case of modular architectures with multiple contracts dependant upon the Oraclize service.

#### Examples  

Contract sources and associated computation archive can be found at: https://github.com/oraclize/ethereum-examples/tree/master/solidity/lib-experimental

Direct browser-solidity link to examples: https://dapps.oraclize.it/browser-solidity/#version=soljson-v0.4.19+commit.c4cbbb05.js&optimize=false&gist=ad3d1f6007942b727f5909b55e6445d2

NOTE: if the `OffchainConcat.sol` contract returns an empty string as the result, ensure the multihash can be retrieved from IPFS, and if not, you must run your own IPFS daemon, serving the archive, or upload using Infura.
