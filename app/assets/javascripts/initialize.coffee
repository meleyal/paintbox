window.app = {}
app.models = {}
app.collections = {}
app.views = {}

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.collections.swatches = new Swatches()
    app.views.swatches = new SwatchesView()

    if $('body').is('#profile')
      user = $('body').data('id')
      app.collections.swatches.url = '/users/' + user + '/swatches'
      app.views.picker = new PickerView()

  app.initialize()