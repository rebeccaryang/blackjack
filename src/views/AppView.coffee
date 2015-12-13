class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="wallet-container"></div>
    <div class="bet-container"></div>
    <div class="player-hand-container active-player"></div>
    <div class="dealer-hand-container"></div>
    <div class="ewewon-container">
      <div class="ewewon-content">
        <img src="img/ewewon.png">
        <img src="img/unicorn.gif">
      </div>
    </div>
    <div class="dealerwon-container">
      <div class="dealerwon-content">
        <img src="img/ewelost.gif">
      </div>
    </div>
  '

  events:
    'click .hit-button': -> 
      @model.get('wallet').setBet(Number $('.bet-container').find('input').val())
      @model.get('playerHand').hit()


    'click .stand-button': -> 
      @model.get('wallet').setBet(Number $('.bet-container').find('input').val())
      @model.get('playerHand').stand()


  initialize: ->
    @render()
    @model.on('change', =>
      @render()
    )
    @model.on('Ewewon', =>
      @eweWon()
    )
    @model.on('Dealerwon',=>
      @dealerWon()
    )
    # @model.get('playerHand').on('stand',=>
    #   $ '.player-hand-container'
    #     .toggleClass 'active-player'
    #   $ '.dealer-hand-container'
    #     .toggleClass 'active-player'
    #   return

    # )

    return

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.bet-container').html new BetView(model: @model.get 'wallet').el
    @$('.wallet-container').html new WalletView(model: @model.get 'wallet').el
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @$('.history-container').html new HistoryView(collection: @model.get 'gameHistory').el
    return

  eweWon: ->
    $('.ewewon-container').css('display','block')

  dealerWon: ->
    $('.dealerwon-container').css('display','block')

