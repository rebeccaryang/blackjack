assert = chai.assert
expect = chai.expect

describe "hand constructor", ->

  it "should create a card collection", ->
    deck = new Deck()
    hand = deck.dealPlayer()
    assert.strictEqual hand.length, 2

  it "should add a card on hit", ->
    deck = new Deck()
    hand = deck.dealPlayer()
    hand.hit()
    assert.strictEqual hand.length, 3
    return

  it "should bust on bust", ->
    bustSpy = sinon.spy Hand.prototype, 'bust'
    deck = new Deck()
    hand = deck.dealPlayer()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()
    hand.hit()
    expect bustSpy
      .to.have.been.called
    Hand.prototype.bust.restore()
    return;

