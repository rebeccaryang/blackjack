class window.BetView extends Backbone.View
  className: 'bet'
  template: _.template '<input type="text"><%=bet%></input>'
  initialize: ->
    @render()

  render: ->
    @$el.html @template @model.attributes