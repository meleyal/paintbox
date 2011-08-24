class window.SwatchesView extends Backbone.View
	
	el: '#paintbox'

	initialize: ->
		app.collections.swatches.bind 'add', @addOne
		app.collections.swatches.bind 'reset', @addAll
		@addAll()

	addOne: (swatch) =>
		view = new SwatchView model: swatch
		$(@el).append view.el

	addAll: =>
		app.collections.swatches.each @addOne