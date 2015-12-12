class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png">'
  
  initialize: -> @render()

  render: =>
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    #@$el.css 'opacity', 0
    #@$el.animate {'opacity':100}, 5000
    return

