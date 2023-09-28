const { expect } = require('chai');

describe('Factory', () => {
  async function deploy() {
    const [owner, otherAccount] = await ethers.getSigners();
    const Factory = await ethers.getContractFactory('Factory');
    const factory = await Factory.deploy();
    return { factory, owner, otherAccount };
  }
  it('should create a new account', async () => {
    const { factory, owner } = await deploy();
    await factory.connect(owner).createAccount();
    const account = await factory.accounts(owner.address);
    expect(account).to.not.equal('0x0000000000000000000000000000000000000000');
  })
});
