class WatsonService

  attr_reader :conn

  def initialize
   @conn = Faraday.new(url: "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19")
   @conn.basic_auth("#{ENV["USERNAME"]}", "#{ENV["TOKKEN"]}")
  end

  def watson_tone
   @chat_data = File.read('log/twitch_chat.log')
    response = @conn.post do |req|
      req.headers['Content-Type'] = 'text/plain;charset=utf-8'
      req.body = @chat_data
    end
    %x(cat /dev/null > log/twitch_chat.log)
    @parsed_response = parse(response)
  end

  def captured_data
    @parsed_response
  end

  def self.read_chat

  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
