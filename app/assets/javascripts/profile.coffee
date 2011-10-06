$(document).ready ->
  collection = new UserSwatches
  new SwatchesView({ collection })
  new PickerView({ collection })