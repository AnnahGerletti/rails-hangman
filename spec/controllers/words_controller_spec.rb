require 'rails_helper'


RSpec.describe WordsController do 
fixtures :games, :guesses, :words


  describe "GET #index" do 
    context "when implimenting @word" do 
      it "lists all the words" do
        get :index

        expect(assigns(:words)).to eq Word.all
      end

      it "renders the index template" do
        get :index

      expect(response).to render_template(:index)
      end
    end
  end

  describe "POST #create" do
    let!(:word) {words(:w1).word}
    context "when a user adds a new word" do
      it "the word gets saved to the DB" do
        
          word = Word.new

          expect{post(:create, :params => {:word => {word: word}})}.to change(Word, :count).by(1)
          
      end
      
      context 'when a word is saved' do
        it "redirects to show the new word" do
          post(:create, :params => {:word => {word: words}})

          expect(response).to redirect_to(words_index_path)
        end
      end 
    end
  end

  describe "DELETE #destroy" do
    let!(:word) {words(:w1).word}
    context "when a user removes a word" do
      it "deletes it from data base" do
        #don't know why this passes what is wors.to_params doing
        params = {:id => words.to_param }
        expect{delete :destroy, params: params}.to change(Word, :count).by(-1)

      end

      it "redirects to word index page" do 
        params = {:id => words.to_param }
        delete :destroy, :params => params 
        
        expect(response).to redirect_to(words_index_path)
      end
    end
  end
end