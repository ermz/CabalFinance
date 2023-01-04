import { expect } from "chai";
import { ethers } from "hardhat";

describe("Cabal", function () {
    let CABAL;

    beforeEach(async () => {
        const LendingHelpers_contract = await ethers.getContractFactory(
            'LendingHelpers'
        )
        const LendingHelpers = await LendingHelpers_contract.deploy();

        const CabalContract = await ethers.getContractFactory("Cabal", {
            libraries: {
                LendingHelpers: LendingHelpers.address
            }
        });
        CABAL = await CabalContract.deploy();
    })

    describe("Issue Bond", () => {
        it("should reject call if less than one ETH is passed for Bond collateral", async function () {
            await expect(CABAL.issueBond(15778458, 1000)).to.be.revertedWith("Must deposit atleast one ETH")
        })

        it("should revert if passed an invalid maturity time", async function () {
            await expect(CABAL.issueBond(100, 1000)).to.be.revertedWith("INVALID maturity time");
        })
    })
})
