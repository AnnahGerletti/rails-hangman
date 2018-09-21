# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GamesController do
  fixtures :games

  describe 'GET #new' do
    it 'creates a new game' do
      get :new

      expect(assigns(:game)).to be_a_new(Game)
    end
  end

  describe 'POST #create' do
    # let (:name) { "Name"}
    # let (:lives) { 5 }
    let! (:word) { Word.create!(word: 'example') }
    # let! (:game) {Game.create}
    # let (:params) { name: "Chris"}

    context 'when game is started with a name' do
      let (:new_game) { Game.create }

      it 'redirects to show template on game path' do
        # def post(method, options)
        post(:create, params: { game: { lives: 3, name: 'Ham' } })
        # had to specify the correct game_id to get to the game path (show)
        location = game_path(Game.last)

        expect(response).to redirect_to(location)
      end

      it 'saves to the database' do
        params = { game: { lives: 3, name: 'Ham' } }

        expect { post(:create, params: params) }.to change(Game, :count).by(1)
      end
    end

    context 'when the game is started without a name' do
      it 'renders the new template' do
        params = { game: { lives: 2 } }

        # def post(method, params:)
        post(:create, params: params)

        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET show'
  context 'when it shows games' do
    let!(:game) { games(:g1) }
    it ' game does exist' do
      # set up testing environmnet
      params = { id: game }
      get(:show, params: params)
      # need to pass a hash when passing params
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
    it " doesn't exist " do
      get :show, params: { id: 2 }
      expect(response.status).to eq(404)
    end
  end
end
