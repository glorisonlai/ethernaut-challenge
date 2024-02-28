import { ethers } from "hardhat";

async function main() {
  const fallback = await ethers.deployContract("Fallback");

  await fallback.waitForDeployment();

  console.log(fallback);

  console.log(`Fallback deployed to ${fallback.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
