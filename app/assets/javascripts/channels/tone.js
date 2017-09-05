App.tones = App.cable.subscriptions.create('ToneChannel', {
  received: function(data) {
    $('#tones_tag').append(data.tone_data)
  }
});
