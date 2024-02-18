import { expect } from "chai";
import { ethers } from "hardhat";
import { Access } from "../typechain-types";

describe("Access", function () {
  let access: Access;
  before(async () => {
    const [owner] = await ethers.getSigners();
    const accessFactory = await ethers.getContractFactory("YourContract");
    access = (await accessFactory.deploy(owner.address)) as Access;
    await Access.waitForDeployment();
  });
});
