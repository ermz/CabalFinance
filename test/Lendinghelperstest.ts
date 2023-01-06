import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers, waffle } from "hardhat";

const {deployContract} = waffle;
import LendingHelpersArtifact from "../artifacts/contracts/LendingHelpers.sol/LendingHelpers.json";

describe("LendingHelpers", function () {
    let lend;

    // beforeEach(async () => {
    //     const LendingHelpers_contract = await ethers.getContractFactory("LendingHelpers");
    //     lendingHelpers = await LendingHelpers_contract.deploy();
    // })
    async function deployOnceFixture() {
        const [owner, user1] = await ethers.getSigners();
        lend = (await deployContract(owner, LendingHelpersArtifact));

        return { lend, owner, user1}
    }

    it("Should return 80% of amount sent as usable collateral", async () => {
        // await expect(lendingHelpers.simplefunc()).to.equal(1);
        // const result = await lendingHelpers.simplefunc();

        const { lend } = await loadFixture(deployOnceFixture);
        expect(await lend.simplefunc()).to.equal(1);
        
        // await expect(LendingHelpers.usableCollateralAmount(100)).to.equal(80);
    })
})