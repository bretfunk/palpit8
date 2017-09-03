App.tones = App.cable.subscriptions.create('ToneChannel', {
  received: function(data) {
    alert(data.tone_data[:tone_data][0][:score]);
  }
});
