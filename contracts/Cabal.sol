// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./LendingHelpers.sol";

contract Cabal {

    address public CABAL_OWNER;
    uint256 public bondId;

    // Roughly 1 ETH
    uint256 public constant MINIMUM_BOND_DEPOSIT = 1000000000000000000;

    // Bond Maturity
    uint256 public constant SIX_MONTHS = 15778458;
    uint256 public constant ONE_YEAR = 31556926;
    uint256 public constant TWO_YEAR = 63113852;

    // bondId => amount of bonds left
    mapping(uint256 => uint256) bondsAvailable;

    // bondId to BondInfo struct
    mapping(uint256 => BondInfo) bonds;

    mapping(address => uint256) maturityDate;

    struct BondInfo {
        address owner;
        uint256 maturity;
        uint256 bondsIssued;
        uint256 perBondAmount;
        uint256 amountOfBonds;
    }

    constructor() {
        CABAL_OWNER = msg.sender;
    }

    // Company Bond Setup
    // Needs to deposit funds
    // Amount deposited will calculate how much company can request for borrowing
    // Will also need to give company an equal amount of CBL Token.
    // Amount will be used an an assuarance of how much they will get back,
    // In the case that they don't pay back in a timely matter
    // They will lose their CBL Tokens and therefore their ability to get their original collateral back
    function issueBond(uint256 maturity, uint256 amount) external payable {
        // Might use Chainlink to check for how much an ETH is worth currently
        require(msg.value > MINIMUM_BOND_DEPOSIT, "Must deposit atleast one ETH");

        require(maturity == SIX_MONTHS || maturity == ONE_YEAR || maturity == TWO_YEAR, "INVALID maturity time");

        // Need to figure out how much of msg.value deposited,
        // needs to be left to pay interest for bond buyers
        // Use function from LendingHelper Library
        uint256 usableCollateral = LendingHelpers.usableCollateralAmount(msg.value);

        // amountPerBond needs to change depending on usable collateral
        uint256 amountPerBond = usableCollateral / amount;

        bonds[bondId] = BondInfo(
            msg.sender,
            maturity,
            msg.value,
            amountPerBond,
            amount
        );

        maturityDate[msg.sender] = block.timestamp + maturity;

        bondId = bondId += 1;

        // Transfer CBL Token to  msg.sender
    }

    // function acceptBond(uint256 _bondId, uint amount) external {
    //     require(amount <= bondsAvailable[_bondId], "Trying to purchase too many bonds")
    //     require(msg.value >= bonds[_bondId].perbondAmount * amount, "Not enough to buy/accept bond")
    // }
}