window.app = {}
app.models = {}
app.collections = {}
app.views = {}

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.collections.swatches = new Swatches()
    app.views.swatches = new SwatchesView()
		
  app.initialize()