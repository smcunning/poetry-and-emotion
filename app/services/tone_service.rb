class ToneService
  def self.analyze_poem_tones(poem)
    results = conn.get(ENV['IBM_URL'] + "/v3/tone?version=2017-09-21&text=#{poem}")
    JSON.parse(results.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.us-south.tone-analyzer.watson.cloud.ibm.com") do |connection|
      connection.basic_auth("apikey", ENV['IBM_API_KEY'])
    end
  end
end
