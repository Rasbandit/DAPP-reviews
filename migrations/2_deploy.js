const SchloadCoin = artifacts.require("SchloadCoin");

module.exports = async function(deployer) {
	await deployer.deploy(SchloadCoin)
};