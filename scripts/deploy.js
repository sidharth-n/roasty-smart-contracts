const hre = require("hardhat")

async function main() {
  const Nameplate = await hre.ethers.getContractFactory("Subscription")
  console.log("Deploying Subsciption contract...")

  const nameplate = await Nameplate.deploy()
  await nameplate.waitForDeployment()
  const contractAddress = await nameplate.getAddress()
  console.log(`Subsciption deployed at : ${contractAddress}`)
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error)
    process.exit(1)
  })
