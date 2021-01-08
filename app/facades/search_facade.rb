class SearchFacade
  def self.get_poems(author)
    poems = PoemService.get_poems(author)
    create_poem_objects(poems)
  end

  def self.create_poem_objects(poems)
    poems.map do |poem|
      Poem.new(poem)
    end
  end

  def self.get_tones()
    
  end
end
