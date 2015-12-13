class window.HistoryView extends Backbone.View

  tagName: 'table'

  className: 'history'

  template: _.template ""

  initialize: =>
    @render()

  render: =>
    @$el.html "<th>Ewe</th><th>Dealer</th>"
    @$el.append @collection.map (entry) =>
      new HistoryEntryView(model: entry).$el