# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    # event handlers
    @get 'playerHand'
      .on('bust', =>
        # We know the player lost
        @gameEnded("Dealer")
        # @initialize()
        return
      )
    @get 'dealerHand'
      .on('bust',=>
        # We know the dealer lost
        @gameEnded('Ewe')
        # @initialize()
        return
      )

    @get 'playerHand'
      .on('stand', =>
        @playerStands()
      )

    return
  gameEnded: (winner)->
    alert "#{ winner } won!"
    @initialize()

  playerStands: ->
    busted = false
    @get 'dealerHand'
      .on('bust',->
        busted = true
        return
    )
    @get 'dealerHand'
      .at(0).flip()
    @get 'dealerHand'
      .finishHand()
    if not busted
      @compare()

  compare: ->
    dealer = @get ('dealerHand')
      .bestScore()
    ewe = @get('playerHand')
      .bestScore()
    if dealer >= ewe
      @gameEnded('Dealer')
    else
      @gameEnded('Ewe')






