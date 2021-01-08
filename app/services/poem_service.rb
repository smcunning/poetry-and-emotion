class PoemService
  def self.get_poems(author)
    results = conn.get("/author/") do |req|
      req.params[:author] = author
    end
    require "pry"; binding.pry
  end

  def self.conn
    Faraday.new(url: 'https://poetrydb.org/')
  end
end
