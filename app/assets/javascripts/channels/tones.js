App.tones = App.cable.subscriptions.create('ToneChannel', {
  received: function(data) {
    if (data.tone_data == 'Anger') {
      $(".nextButton").css('border','10px solid #EB2316');
    } else if (data.tone_data == 'Joy') {
      $(".nextButton").css('border','10px solid #40EB16');
    } else if (data.tone_data == 'Sadness') {
      $(".nextButton").css('border','10px solid #1657EB');
    } else if (data.tone_data == 'Disgust') {
      $(".nextButton").css('border','10px solid #E9BE1C');
    } else if (data.tone_data == 'Fear') {
      $(".nextButton").css('border','10px solid #712619');
    }
    return $("#tones").text(this.renderTone(data));
  },

  renderTone: function(data) {
    return "<p>" + data.tone_data + "</p>";
  }
});

window.setInterval(function(){
  App.tones.send({message: 'dummy'})
}, 5000);
