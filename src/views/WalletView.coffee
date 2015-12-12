class window.WalletView extends Backbone.View
  className: 'wallet'

  template: _.template '<h2>Wallet: $<%=money%></h2>'

  initialize: ->
    @render()
    @model.on 'change', => @render()

  render: ->
    @$el.children().detach();
    @$el.html @template @model.attributes
