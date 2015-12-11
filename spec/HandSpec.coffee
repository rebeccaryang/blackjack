assert = chai.assert

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
