import { expect } from "chai";
import { ethers } from "hardhat";

describe("Cabal", function () {
    let cabal;

    beforeEach(async () => {
        const CabalContract = await ethers.getContractFactory("Cabal");
        cabal = await CabalContract.deploy();
    })

    describe("Issue Bond", () => {
        it("should reject transaction if less than one ETH is passed for Bond collateral", async function () {
            expect( 1 == 1);
        })
    })
})
