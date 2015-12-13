class window.HistoryEntry extends Backbone.Model
  defaults:
    playerHand: null
    dealerHand: null
    winner: null
    bet: null
  initialize:(playerHand,dealerHand,winner,bet) =>
    @set 'playerHand', playerHand
    @set 'dealerHand', dealerHand
    @set 'winner', winner
    @set 'bet', bet

