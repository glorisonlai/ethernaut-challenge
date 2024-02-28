import { ethers } from "hardhat";

type ContractDeployOptions = {
  value?: number;
};

type SolPrimitive = number | string | boolean;

async function main() {
  const contractName = "Fallout";
  const args: SolPrimitive[] = [];
  const contractOpts: ContractDeployOptions = {};
  const fallout = await ethers.deployContract(contractName, args, contractOpts);

  await fallout.waitForDeployment();

  const argsStr = args.length ? `(${args.join(", ")})` : "";
  const contractOptsStr = Object.keys(contractOpts).length
    ? `, with opts ${JSON.stringify(contractOpts)}`
    : "";
  console.log(
    `Fallout${argsStr} ${contractOptsStr} deployed to ${fallout.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
