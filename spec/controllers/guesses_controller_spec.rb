require 'rails_helper'


RSpec.describe GuessesController do 
fixtures :games, :guesses, :words

#removed #new and #index test becuase was not using those actions in the controller

  describe "POST #create" do
    context "when a guess is submitted" do
      let!(:game) {games(:g1)} #! tells the test the game already exits.
      # the let tells the test to use the ficture game so we don;t have to create a new game
     context "when the guess is entered correctly" do
      it "saved correctly" do 
        # test that @game.guesses increses by one
        params = {:game_id => game.to_param, :guess => {:guess => 'c' }}
        # game.to_params takes game and finds the id
        # double guess hash, found this from inspecting the form in browser.
        expect{post :create, params: params}.to change{game.guesses.count}.by 1
        # params is always passed in as a hash
        end
      end
      context "when the guess is entered incorrectly" do
        it "not saved" do
          params = {:game_id => game.to_param, :guess => {:guess => 'cd' }}
          expect{post :create, params: params}.to_not change{game.guesses.count}
        end
      end

        it "raises an error" do 
          #todo this might be better tested with a cucumber
          params = {:game_id => game.to_param, :guess => {:guess => 'cd' }}

          post(:create, :params => params)
          expect(response).to redirect_to(game)
       
          expect(flash[:notice]).to be_present

          #main Issue - cannot call a redirect after a block, have to pull out the post and call expect with the rails generated response. 
      end
    end
  end
end
