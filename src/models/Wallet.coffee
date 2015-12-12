class window.Wallet extends Backbone.Model
  defaults:
    money: 763
    bet: 0
  initialize: =>

  eweWon: =>
    @set 'money', @get('money') + @get('bet')

  dealerWon: =>
    @set 'money', @get('money') - @get('bet')
