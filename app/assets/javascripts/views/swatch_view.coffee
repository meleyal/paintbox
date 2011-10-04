class window.SwatchView extends Backbone.View

  tagName: 'li'

  className: 'swatch'

  initialize: ->
    @render()

  render: ->
    $(@el).css('background', @model.get('color').value)