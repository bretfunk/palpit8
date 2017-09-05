App.tones = App.cable.subscriptions.create('ToneChannel', {
  received: function(data) {
    var mood = data.tone_data
    let words = $('.tones').text(mood)
    $('.box').text(words)
  }
});
