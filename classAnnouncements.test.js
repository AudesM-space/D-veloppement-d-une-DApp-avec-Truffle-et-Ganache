

const Annonce = artifacts.require("annonce");

contract("Annonce", accounts => {
  it("ajoute et lit une annonce", async () => {
    const inst = await Annonce.deployed();
    await inst.addAnnouncement("Première annonce", { from: accounts[0] });
    const total = await inst.totalAnnouncements();
    assert.equal(total.toNumber(), 1, "Il doit y avoir 1 annonce");

    const ann = await inst.getAnnouncement(0);
    assert.equal(ann.message, "Première annonce", "Le message doit correspondre");
    assert.equal(ann.author, accounts[0], "L'auteur doit être accounts[0]");
  });
});
