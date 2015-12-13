# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: =>
    @set 'wallet', wallet = new Wallet()
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'gameHistory', history = new History() #Sets game history collection
    # event handlers
    @get 'playerHand'
      .on('bust', =>
        # We know the player lost
        @gameEnded("Dealer")
        return
      )
    @get 'dealerHand'
      .on('bust',=>
        # We know the dealer lost
        @gameEnded('Ewe')
        return
      )
    @get 'playerHand'
      .on('stand', =>
        @playerStands()
      )

    @get 'playerHand'
      .on('gameStarted', =>
        @get 'wallet' 
          .set 'editable', false
      )
    return
  reinitialize: =>
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get 'wallet'
      .set 'editable', true
    # @set 'gameStarted', false
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

    @get 'playerHand'
      .on('gameStarted', =>
        @get 'wallet' 
          .set 'editable', false
      )
    return


  gameEnded: (winner)=>
    # alert "#{ winner } won!"
    #@get('gameHistory').add(@get('playerHand'),@get('dealerHand'),winner,@get('wallet').get('bet'))
    @trigger(winner+'won')
    that = @
    @get('gameHistory').add(new HistoryEntry(that.get('playerHand'), that.get('dealerHand'), winner, @get('wallet').get('bet')))
    if winner is 'Ewe'
      @get 'wallet'
        .eweWon()
    else
      @get 'wallet'
        .dealerWon()
    setTimeout that.reinitialize,3000
    return

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
      # @compare()
      @gameEnded @compare()

  compare: ->
    dealer = @get ('dealerHand')
      .bestScore()
    ewe = @get('playerHand')
      .bestScore()
    if dealer >= ewe
      return 'Dealer'
    else
      return 'Ewe'






