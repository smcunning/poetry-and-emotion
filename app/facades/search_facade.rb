class SearchFacade
  def self.get_poems(author)
    poems = PoemService.get_poems(author)
    poem_objs = create_poem_objects(poems)
    analyze_tones(poem_objs)
  end

  def self.create_poem_objects(poems)
    poems.map do |poem|
      Poem.new(poem)
    end
  end

  def self.analyze_tones(poem_objs)
    poem_objs.each do |poem|
      json = ToneService.analyze_poem_tones(poem.text)
      json[:document_tone][:tones].each do |tone|
        poem.tones << tone[:tone_name]
      end
    end
  end
end
