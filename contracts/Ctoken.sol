// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Ctoken is ERC20, Ownable {
    constructor() ERC20("Ctoken", "CBL") {
        
    }
}