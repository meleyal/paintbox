class window.SwatchView extends Backbone.View

  tagName: 'li'

  className: 'swatch'

  template: JST["templates/swatch"]

  initialize: ->
    @render()

  render: ->
    $(@el).html(@template( swatch: @model.toJSON() ))
    $(@el).find('a').tipsy({ gravity: 's', fade: true, delayIn: 500, offset: 2 })