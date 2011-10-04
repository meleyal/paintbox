class window.PickerView extends Backbone.View

  el: '#picker'

  events:
    'submit form' : 'addSwatch'

  initialize: ->
    console.log 'initialize'

  addSwatch: (e) ->
    console.log 'addSwatch'
    e.preventDefault()
    val = $('#swatch_colors_value').val();
    data = { swatch: { colors: { value: val } } };
    $(data).serializeObject();
    s = new Swatch(data);
    s.save(null, { success: ->
      app.collections.swatches.fetch()
      # app.collections.swatches.add(s)
    });