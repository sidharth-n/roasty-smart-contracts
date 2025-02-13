const hre = require("hardhat")

async function main() {
  const Nameplate = await hre.ethers.getContractFactory("SafeFactory")
  console.log("Deploying SafeFactory contract...")

  const nameplate = await Nameplate.deploy()
  await nameplate.waitForDeployment()
  const contractAddress = await nameplate.getAddress()
  console.log(`SafeFactory deployed at : ${contractAddress}`)
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error)
    process.exit(1)
  })
