assert = chai.assert
expect = chai.expect

describe "App", ->
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
    it "Should end the game on player stand", ->
      gameEndSpy = sinon.spy App.prototype, 'gameEnded'
      app = new App()
      app.get 'playerHand'
        .trigger 'stand'
      expect gameEndSpy
        .to.have.been.called
      App.prototype.gameEnded.restore()
      return
    return
  
  describe "Should compare scores", ->
    it "should return dealer if dealer wins", ->
      app = new App()
      app.set 'dealerHand', new Hand [new Card {rank: 11, suit: 1}, new Card {rank: 5, suit: 1}]
      app.set 'playerHand', new Hand [new Card {rank: 3, suit: 1}, new Card {rank: 5, suit: 1}]
      assert.equal app.compare(), 'Dealer'
      assert.notEqual app.compare(), 'Ewe'
      return

    it "should return dealer if dealer ties", ->
      app = new App()
      app.set 'dealerHand', new Hand [new Card {rank: 11, suit: 1}, new Card {rank: 5, suit: 1}]
      app.set 'playerHand', new Hand [new Card {rank: 11, suit: 1}, new Card {rank: 5, suit: 1}]
      assert.equal app.compare(), 'Dealer'
      assert.notEqual app.compare(), 'Ewe'
    it "should return player if player wins", ->
      app = new App()
      app.set 'dealerHand', new Hand [new Card {rank: 3, suit: 1}, new Card {rank: 5, suit: 1}]
      app.set 'playerHand', new Hand [new Card {rank: 11, suit: 1}, new Card {rank: 5, suit: 1}]
      assert.equal app.compare(), 'Ewe'
      assert.notEqual app.compare(), 'Dealer'
    return
  return


return