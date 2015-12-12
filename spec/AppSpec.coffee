assert = chai.assert
expect = chai.expect

describe "Initialize", ->
  app = new App()

  it 'should have a deck', ->
    assert.notEqual app.get 'deck', undefined
  it 'should have a playerHand', ->
    assert.notEqual app.get 'playerHand', undefined
  it 'should have a dealerHand', ->
    assert.notEqual app.get 'dealerHand', undefined
  it 'should have a wallet', ->
    assert.notEqual app.get 'wallet', undefined
return

describe "Game Ended", ->
  describe "Should end the game on bust", ->
    it 'bust the game for player', ->
      # Initialize an app
      # Create a deck
      # Create a hand
      # Trigger bust
      gameEndSpy = sinon.spy App.prototype, 'gameEnded'
      app = new App()
      app.get 'playerHand'
        .trigger 'bust'
      expect gameEndSpy
        .to.have.been.called
      App.prototype.gameEnded.restore()
      return

    it 'bust the game for dealer', ->
      gameEndSpy = sinon.spy App.prototype, 'gameEnded'
      app = new App()
      app.get 'dealerHand'
        .trigger 'bust'
      expect gameEndSpy
        .to.have.been.called
      App.prototype.gameEnded.restore()
      return
    return
  return
return