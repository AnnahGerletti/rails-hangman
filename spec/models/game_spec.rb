# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validation' do
    let(:game) { Game.new(name: name, word: word) }

    context 'no name given' do
      let(:name) { '' }
      let(:word) { 'hello' }
      it 'is invalid' do
        expect(game.valid?).to be false
        # calling game.new and valid? it check if game can be saved.
      end
    end

    context 'no word' do
      let(:name) { 'Joe' }
      let(:word) { '' }
      it 'invalid without word' do
        expect(game.valid?).to be false

      end
    end

    context 'name and word present' do
      let(:name) { 'Joe' }
      let(:word) { 'Annah' }

      it 'is valid' do
        expect(game.valid?).to be true
      end
    end
  end
  

  describe 'associations' do
    context 'Game has many guesses' do
      it 'returns true' do
        reflection_game_to_guesses = Game.reflect_on_association(:guesses)
        # expect(game).to have_many(:guesses)
        byebug
        
        expect(reflection_game_to_guesses.macro).to eq(:has_many)
      end
    end
  end
 end

# same structure, just create an environment that test the validations. -
# construct an object with name nil - should not create object
# update name from real to nil should not work
