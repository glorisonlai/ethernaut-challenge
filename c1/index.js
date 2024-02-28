import { ethers } from "ethers";

const provider = new ethers.providers.JsonRpcProvider("http://localhost:8545");

const accounts = await provider.getSigner();
const signer = provider.getSigner(accounts[0]);
const tx = {
  to: "0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0",
  value: ethers.utils.parseEther("2", "ether"),
};
const transaction = await signer.sendTransaction(tx);
