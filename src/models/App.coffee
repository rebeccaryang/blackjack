# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # event handlers
    @get 'playerHand'
      .on('gameEnded', =>
        # We know the player lost
        alert 'player lost'
        # @initialize()
        return
      )
    @get 'dealerHand'
      .on('gameEnded',=>
        # We know the dealer lost
        alert 'dealer lost'
        # @initialize()
        return
      )

    @get 'playerHand'
      .on('stand', =>
        
      )
    return

