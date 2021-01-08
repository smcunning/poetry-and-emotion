require 'rails_helper'

describe 'Poem Service' do
  context 'instance methods' do
    context '#get_poems' do
      it 'returns a list of 10 poems by author' do
        author = { author: "Emily" }
        search = PoemService.get_poems(author)

        expect(search).to be_an Array
        poem_data = search.first

        expect(poem_data).to have_key :title
        expect(poem_data).to have_key :author
        expect(poem_data).to have_key :lines
        expect(search.count).to eq (10)
      end
    end
  end
end
