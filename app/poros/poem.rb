class Poem
  attr_reader :title,
              :author,
              :text
  attr_accessor :tones
  def initialize(attributes)
    @title = attributes[:title]
    @author = attributes[:author]
    @text = attributes[:lines].join(' ')
    @tones = []
  end
end
