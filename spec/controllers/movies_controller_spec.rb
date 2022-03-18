require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:list) { List.create(name: 'Top 10', comment: 'My Top 10 favorite movies of all times') }

  describe 'POST #create' do
    before do
      post :create, params: { movie: { title: 'The Lord of the Rings I', poster_url: 'shorturl.at/krJSV' }, list_id: list.id }
    end

    it 'creates a Movie' do
      expect(Movie.find_by(title: 'The Lord of the Rings I').list_id).to eq(list.id)
    end

    it 'redirects to List show_path' do
      expect(response).to redirect_to list_path(Movie.find_by(title: 'The Lord of the Rings I').list_id)
    end
  end
end
