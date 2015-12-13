class window.HistoryEntryView extends Backbone.View
  tagName: 'tr'

  className: 'historyEntry'

  template: _.template '<td class="history-player"></td><td class="history-dealer"></td>'

  initialize: =>
    @render()

  render: =>
    @$el.children().detach()
    @$el.html @template @collection
    that = @
    @$el.find '.history-player'
      .append @model.get 'playerHand'.models
        .map (card) =>
          #new CardView(model: card).$el
    @$el.find '.history-dealer'
      .append @model.get 'dealerHand'.models
        .map (card) =>
          #new CardView(model: card).$el
    return
