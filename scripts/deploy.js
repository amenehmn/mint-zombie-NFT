const main = async () => {
  const nftContractFactory = await hre.ethers.getContractFactory('MyZombieNFT');
  const nftContract = await nftContractFactory.deploy(100);
  await nftContract.deployed();
  console.log("Contract deployed to:", nftContract.address);

  // Call the function.
  let txn = await nftContract.makeAnZombieNFT()
  // Wait for it to be mined.
  await txn.wait()
  console.log("Minted NFT #1")

  /* txn = await nftContract.makeAnZombieNFT()
  // Wait for it to be mined.
  await txn.wait()
  console.log("Minted NFT #2") */
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();