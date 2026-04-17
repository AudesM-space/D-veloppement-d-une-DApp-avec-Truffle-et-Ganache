const SimpleStorage = artifacts.require("SimpleStorage");
contract("SimpleStorage", accounts => {
it("stocke et renvoie la bonne valeur", async () => {
const inst = await SimpleStorage.deployed();
await inst.set(777, { from: accounts[0] });
const v = await inst.data();
assert.equal(v.toNumber(), 777);
})});