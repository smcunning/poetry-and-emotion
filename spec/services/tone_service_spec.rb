require 'rails_helper'

describe 'Tone Service' do
  context 'instance methods' do
    context '#analyze_poem_tones' do
      it 'returns a list of tones for supplied text' do
        text = "Not at Home to Callers Says the Naked Tree -- Bonnet due in April -- Wishing you Good Day --"
        tone_data = ToneService.analyze_poem_tones(text)

        expect(tone_data).to be_an Hash
        tones = tone_data[:document_tone][:tone_name]

        expect(tone_data).to have_key :document_tone
        expect(tone_data[:document_tone]).to have_key :tone_name
        expect(tones).to be_a String
      end
    end
  end
end
