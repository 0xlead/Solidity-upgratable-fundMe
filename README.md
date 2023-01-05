# Solidity-upgratable-fundMe

Solidity contracts cannot be issued once they are deployed on the blockchain. If they could be regulated, there would be no need for the idea of decentralization behind their work on the blockchain anyway.

This is good for trust between a developer and user

But when it comes to "technology" anything is open to exploitation.

What distinguishes EVM-based blockchains from other blockchains is smart contracts. People write these, sometimes unchecked, even the best audited contracts can be vulnerable. 

That's exactly the problem upgradeable contracts want to solve.

*The image below gives an idea of how these contracts work*
![](https://i.stack.imgur.com/5VEOd.png)


# How to use this project

- Alice deploys the `FundMe.sol` smart contract
- Alice then deploys the ProxyContract.sol contract
- Alice calls the address of the `ProxyContract` contract with the `setProxy` function in the `FundMe.sol` contract
- When Alice no longer wants to use the ProxyContract contract, she deploys a new contract with ProxyContract.sol and can change the referrer address in the main contract with setProxy
