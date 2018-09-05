require 'rails_helper'

RSpec.describe GamesController do 

  describe "GET #new" do
      it 'creates a new game' do 
        get :new

        expect(assigns(:game)).to be_a_new(Game)
      end
    end

  describe "POST #create" do
    # let (:name) { "Name"}
    # let (:lives) { 5 }
    # let (:word) { "bird"}
    let! (:game) {Game.create}
    # let (:params) { name: "Chris"}
    

    context "when a game is started with a name" do
      it "redirects to game path" do
        params = {:game => {lives: 3, name: 'Ham'}}
        location = game_path(:game)

        post (:create, params: params)

        expect(response).to redirect_to(location)
        
      end

      it 'saves to the database' do
      end
    end
    
    context "when the game is started without a name" do
      it "renders the new template" do 
        params = {:game => {lives: 2}}

        post (:create, params: params)

        expect(response).to render_template(:new)
      end
    end
  end
end

