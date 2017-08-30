class WatsonService

  attr_reader :conn

  def initialize
   @conn = Faraday.new(url: "https://gateway.watsonplatform.net/tone-analyzer/api/v3/tone?version=2016-05-19")
   @conn.basic_auth("#{ENV["USERNAME"]}", "#{ENV["TOKKEN"]}")
  end

  def read_chat
    response = @conn.post do |req|
      req.headers['Content-Type'] = 'text/plain;charset=utf-8'
      req.body = "Happy happy happy sad sad angry"
    end
    parse(response)
    binding.pry
  end

  def watson_tone
    parse(conn.get("tone?text= I am so happy and so joyful I love this")) 
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

end
