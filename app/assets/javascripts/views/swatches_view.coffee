class window.SwatchesView extends Backbone.View

  el: '#paintbox'

  initialize: (options) ->
    @collection = options.collection
    @collection.bind 'add', @addOne
    @collection.bind 'reset', @addAll
    @addAll()

  addOne: (swatch) =>
    view = new SwatchView model: swatch
    $(@el).append view.el

  addAll: =>
    $(@el).empty()
    @collection.each @addOne