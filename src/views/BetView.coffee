class window.BetView extends Backbone.View
  className: 'bet'
  # template: _.template '<h2>Bet: <input type="text"></input></h2>'
  initialize: =>
    @render()
    @model.on 'change:editable', @uneditize

  render: =>
    # @$el.html @template @model.attributes
    @$el.html('<h2>Bet: <input type="text"></input></h2>')
    @$el.find('input').val(@model.get "bet")
  
  uneditize: =>  
    @$el.find('input').attr('readonly', 'true') if @model.get('editable') is false
