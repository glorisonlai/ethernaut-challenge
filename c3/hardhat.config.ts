import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
require("dotenv").config();

function loadFromEnv(name: string): string {
  const env = process.env[name];
  return env ? env.replace(";", "") : "";
}

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  networks: {
    localhost: {
      url: loadFromEnv("URL_DEV"),
      accounts: [loadFromEnv("PRI_KEY_DEV")!.substring(2, 66)],
    },
    sepolia: {
      url: loadFromEnv("URL_PROD"),
      accounts: [loadFromEnv("PRI_KEY_PROD")!.substring(2, 66)],
    },
  },
};

export default config;
