//CÓDIGO PARA HACER UN DEPLOY

const Migrations = artifacts.require("Migrations");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
