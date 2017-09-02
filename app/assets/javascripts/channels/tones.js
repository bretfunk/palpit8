App.tones = App.cable.subscriptions.create('ToneChannel', {
  received: function(data) {
    return $('#tones').append("<p>" + data.tone_data + "</p>")
  }
});
