App.tones = App.cable.subscriptions.create('ToneChannel', {
  received: function(data) {
    return $("#tones").append(this.renderTone(data));
  },

  renderTone: function(data) {
    return "<p>" + data.tone_data + "/p";
  }
});
