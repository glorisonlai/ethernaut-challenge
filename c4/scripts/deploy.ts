import { ContractFactory } from "ethers";
import { ethers } from "hardhat";

type ContractDeployOptions = {
  value?: number;
};

type SolPrimitive = number | string | boolean;

function loadFromEnv(name: string): string {
  const env = process.env[name];
  return env ? env.replace(";", "") : "";
}

async function main() {
  const contractName = "Relayer";
  const args: SolPrimitive[] = [loadFromEnv("CONTRACT_PROD")];
  const contractOpts: ContractDeployOptions = {};
  const [owner] = await ethers.getSigners();

  const contractFactory = await ethers.getContractFactory(contractName, owner);

  const contract = await contractFactory.deploy(loadFromEnv("CONTRACT_PROD"));

  const argsStr = args.length ? `(${args.join(", ")})` : "";
  const contractOptsStr = Object.keys(contractOpts).length
    ? `, with opts ${JSON.stringify(contractOpts)}`
    : "";
  console.log(
    `${contractName}${argsStr} ${contractOptsStr} deployed to ${contract.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
