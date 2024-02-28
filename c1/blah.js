const { ethers } = require("ethers");

(async () => {
  const provider = new ethers.JsonRpcProvider("http://localhost:8545");

  const accounts = await provider.getSigner();
  const signer = await provider.getSigner(accounts[0]);
  const tx = {
    to: "0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0",
    value: ethers.parseEther("2", "ether"),
  };
  console.log(signer);
  const transaction = await signer.sendTransaction(tx);
})();
