## Provable Ethereum API [![Join the chat at https://gitter.im/oraclize/ethereum-api](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/oraclize/ethereum-api?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge) [![Info@Provable.xyz](https://camo.githubusercontent.com/5e89710c6ae9ce0da822eec138ee1a2f08b34453/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f646f63732d536c6174652d627269676874677265656e2e737667)](http://docs.provable.xyz) [![HitCount](http://hits.dwyl.io/oraclize/ethereum-api.svg)](http://hits.dwyl.io/oraclize/ethereum-api) [![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php) [![Build Status](https://cloud.drone.io/api/badges/provable-things/ethereum-api/status.svg)](https://cloud.drone.io/provable-things/ethereum-api)

&nbsp;

Thanks to this __Ethereum API__, enriching your smart-contracts with external data using __Provable__ is very easy!

In Solidity it is as simple as inheriting the __`usingProvable`__ contract that you'll find in this repository.

This will provide your contract with functions like __`provable_query(...)`__, which make it trivial for you to leverage our oracle technology straight away.

If you're using the __[Remix IDE](http://remix.ethereum.org)__ it's even easier still - simply import the correct version of __Provable__ into your contract like so:

```solidity

import "github.com/provable-things/ethereum-api/contracts/solc-v0.8.x/provableAPI.sol";

```

There are versions of the API targetting the following `solc` compilers:

```
solc-v0.4.25
solc-v0.5.x
solc-v0.6.x
solc-v0.8.x

```

To learn more about the Provable technology, please refer to our __[documentation here](https://docs.provable.xyz)__.

&nbsp;

***

&nbsp;

### :computer: See It In Action!

For working examples of how to integrate the __Provable__ API into your own smart-contracts, head on over to the __[Provable Ethereum Examples](https://github.com/provable-things/ethereum-examples)__ repository. Here you'll find various examples that use __Provable__ to feed smart-contracts with data from a variety of external sources.

There are even __[some examples here](https://github.com/provable-things/ethereum-examples/tree/master/solidity/truffle-examples)__ showing you how you can use __Provable__ in a local Truffle development environment!

&nbsp;

***

&nbsp;

### :mega: __Get In Touch!__

If you want to ask us something, or tell us something, there's loads of ways to get in touch:

__❍__ We have a __[Twitter](https://twitter.com/provablethings)__

__❍__ And a __[Gitter](https://gitter.im/oraclize/ethereum-api)__

__❍__ Or a __[Website](https://provable.xyz)__

__❍__ Alongside a __[Youtube](https://www.youtube.com/channel/UCjVjCheDbMel-x-JYeGazcQ)__

__❍__ Plus a __[Github](https://github.com/provable-things)__

&nbsp;

***

&nbsp;

### :radioactive: __A Note Regarding Serpent:__

:skull: __CAUTION__: It is highly recommended to avoid using Serpent, especially in production. The serpent version of the __Provable__ API herein remains for historical reasons but support for it is no longer maintained. Serpent is considered outdated and audits have shown it to be flawed. Use it at your own risk!
