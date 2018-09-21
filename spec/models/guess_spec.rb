require 'rails_helper'

RSpec.describe Guess, type: :model do

  describe 'validation' do
     let(:game) { Game.create(name: 'Annah', word: 'pie') }
    let (:user_guess) {Guess.new(guess: guess, game_id: game_id)}
    context 'when guess is present' do 
      let(:guess) {"d"}
      let(:game_id) {game.id}
      it 'is valid' do
        expect(user_guess.valid?).to be true
      end

    end
    context 'when a guess is not present' do
      it 'is invalid' do 
      end
    end
  end
end

