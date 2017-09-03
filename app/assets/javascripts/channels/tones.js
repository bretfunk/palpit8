App.tones = App.cable.subscriptions.create('ToneChannel', {
  received: function(data) {
    document.write(data.tone_data)
  }
});
