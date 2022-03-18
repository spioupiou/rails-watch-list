require 'rails_helper'

RSpec.describe Movie, type: :model do
  list = List.new(name: 'Top 10', comment: 'My Top 10 favorite movies of all times')
  let(:movie) { Movie.new(title: 'The Lord of the Rings I', poster_url: 'shorturl.at/krJSV', list: list) }

  describe '#initialize' do
    context 'when valid' do
      it 'generates a valid movie with all necessary fields' do
        expect(movie.valid?).to eq(true)
      end
    end

    # Movie must belong to a watch list
    context 'when invalid' do
      context 'without list' do
        before do
          movie.list = nil
        end

        it 'generates an invalid movie' do
          expect(movie.valid?).to eq(false)
        end

        it 'generates an error message' do
          movie.valid?
          expect(movie.errors.messages).to eq({:list=>["must exist"]})
        end
      end
    end
  end
end
