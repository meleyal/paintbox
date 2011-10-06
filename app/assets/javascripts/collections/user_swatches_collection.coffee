class window.UserSwatches extends window.Swatches

  model: window.UserSwatch

  url: ->
    user = $('body').data('id')
    return '/users/' + user + '/swatches'