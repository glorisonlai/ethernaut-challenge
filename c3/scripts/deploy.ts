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
  const env = loadFromEnv("PROD");
  console.log(env);
  const contractName = "CoinFlipCopy";
  const args: SolPrimitive[] = [];
  const contractOpts: ContractDeployOptions = {};

  const provider = new ethers.JsonRpcProvider(loadFromEnv(`URL_${env}`));
  console.log(loadFromEnv(`URL_${env}`));

  // const signer = new ethers.Wallet(loadFromEnv(`PRI_KEY_${env}`), provider);
  // const [signer] = await ethers.getSigners();

  const contract = await ethers.deployContract(contractName, args);

  await contract.waitForDeployment();

  const argsStr = args.length ? `(${args.join(", ")})` : "";
  const contractOptsStr = Object.keys(contractOpts).length
    ? `, with opts ${JSON.stringify(contractOpts)}`
    : "";

  console.log(
    ` ${contractName}${argsStr} ${contractOptsStr} deployed to ${contract.target}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
