class SearchController < ApplicationController
  def index
    @poems = SearchFacade.get_poems(search_params)
    conn = Faraday.new("https://api.us-south.tone-analyzer.watson.cloud.ibm.com") do |connection|
      connection.basic_auth("apikey", ENV['IBM_API_KEY'])
    end

    @poems.each do |poem|
      response = conn.get(ENV['IBM_URL'] + "/v3/tone?version=2017-09-21&text=#{poem.text}")
      json = JSON.parse(response.body, symbolize_names: true)
      json[:document_tone][:tones].each do |tone|
        poem.tones << tone[:tone_name]
      end
    end
  end

  private

  def search_params
    params.permit(:author)
  end
end
