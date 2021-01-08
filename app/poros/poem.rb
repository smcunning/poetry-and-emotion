class Poem
  attr_reader :title,
              :author,
              :text
  def initialize(attributes)
    @title = attributes[:title]
    @author = attributes[:author]
    @text = attributes[:lines]
  end
end
