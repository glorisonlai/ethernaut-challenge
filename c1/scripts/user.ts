import { ethers } from "hardhat";
import { parseEther } from "ethers";
require("dotenv").config();

function loadFromEnv(name: string): string {
  const env = process.env[name];
  return env ? env.replace(";", "") : "";
}

const abi = [
  "function owner() public view returns (address)",
  "function contribute() public payable returns ()",
  "function withdraw() public payable returns ()",
];

async function main() {
  const contract = loadFromEnv("CONTRACT_PROD");
  console.log(contract);

  const provider = new ethers.JsonRpcProvider(loadFromEnv("URL_PROD"));
  console.log(loadFromEnv("URL_PROD"));

  const signer = new ethers.Wallet(
    loadFromEnv("PRI_KEY_PROD").substring(2, 66),
    provider
  );
  console.log(signer);

  const contractInstance = new ethers.Contract(contract, abi, signer);

  const balance = await provider.getBalance(contract);
  console.log(balance);

  const owner = await contractInstance.owner();
  console.log(owner);

  const withdraw = await contractInstance.withdraw();

  const newBalance = await provider.getBalance(contract);
  console.log(newBalance);

  // const contributeUnsigned = await contractInstance.contribute();
  // contributeUnsigned.value = parseEther("0.0005");
  // const submittedTx = await signer.sendTransaction(contributeUnsigned);
  // await submittedTx.wait();
  //
  // const tx = {
  //   to: contract,
  //   value: parseEther("0.0005"),
  // };
  // const receipt = await signer.sendTransaction(tx);
  // await receipt.wait();
  //
  // const owner2 = await contractInstance.owner();
  // console.log(owner2);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
