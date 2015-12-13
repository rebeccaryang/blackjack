class window.Wallet extends Backbone.Model
  defaults:
    money: 763
    bet: 0
    editable: true
  initialize: =>

  eweWon: =>
    @set 'money', Number @get('money') + Number @get('bet')

  dealerWon: =>
    @set 'money', Number @get('money') - Number @get('bet')

  setBet: (val) =>
    # if @get 'editable'
    @set('bet', val)
