# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GamesHelper do
  describe 'Show word' do
    let(:new_game) { Game.create(name: 'Annah', lives: 1, word: 'pie') }
    let(:new_guess) { Guess.new(guess: 'd') }
    context 'when the game is lost ' do
      it 'displays the word' do
        # have to create the instance of game
        # the instance has to respond to all the same messages in the helper method
        # can mock the instance of the db
        # or create an instance of game
        # Rails code and controller code sit onto of the helper, to test this you have to figure out how to get the instance of the game.
        # either  by assigning or change the helper code to pass game in as a paramiter

        assign(:game, new_game)
        # assign sets the instance var of game from the game helper to, new_game
        # new_game is then used in the expect

        new_game.update_attributes(lives: 0)
        # this is still part of the setup of the game environment

        show_word_result = helper.show_word

        expect(show_word_result).to eq new_game.word
      end
    end
  end
end
