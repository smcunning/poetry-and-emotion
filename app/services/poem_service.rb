class PoemService
  def self.get_poems(author)
    author = author[:author]
    results = conn.get("/author,poemcount/#{author};10")
    parsed = JSON.parse(results.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://poetrydb.org/')
  end
end
