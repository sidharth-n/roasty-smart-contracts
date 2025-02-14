const hre = require("hardhat")

async function main() {
  const Safefactory = await hre.ethers.getContractFactory("SafeFactory")
  console.log("Deploying SafeFactory contract...")

  const safefactory = await Safefactory.deploy()
  await safefactory.waitForDeployment()
  const contractAddress = await safefactory.getAddress()
  console.log(`SafeFactory deployed at : ${contractAddress}`)
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error)
    process.exit(1)
  })
