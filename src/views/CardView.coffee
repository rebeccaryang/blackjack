class window.CardView extends Backbone.View
  className: 'card'

  template: _.template 'url("img/cards/<%= rankName %>-<%= suitName %>.png")'
  
  initialize: -> @render()

  render: =>
    @$el.children().detach()
    #@$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    @$el.css 'background-image', @template @model.attributes if @model.get 'revealed'
    # "img/cards/.png"
    #@$el.css 'opacity', 0
    #@$el.animate {'opacity':100}, 5000
    return

