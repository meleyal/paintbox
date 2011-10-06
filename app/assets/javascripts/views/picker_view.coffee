class window.PickerView extends Backbone.View

  el: '#picker'

  events:
    'submit form' : 'addSwatch'

  addSwatch: (e) ->
    e.preventDefault()
    collection = @collection
    val = $('#swatch_colors_value').val()
    data = { swatch: { colors: { value: val } } }
    $(data).serializeObject()
    s = new Swatch(data)
    s.save(null, { success: ->
      collection.fetch()
    })