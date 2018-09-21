# frozen_string_literal: true

class Guess < ApplicationRecord
  belongs_to :game
  validates :guess, presence: true
  validates :guess, length: { is: 1 }
  validates :guess, format: { with: /\A[a-zA-Z]+\z/ }
  # have to be alpha characters, A - z - says  alphnumeric character has to be at the start and end of string.
  # find some validation that prevents Numbers being entered
end

# When you create a guess it has an accosiated game bc it
# guess.new(game_id => 1)
# test all thew validation situations
