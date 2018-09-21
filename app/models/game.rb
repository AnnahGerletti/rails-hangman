# frozen_string_literal: true

class Game < ApplicationRecord
  has_many :guesses

  validates :name, presence: true
  validates :word, presence: true
end
# game has one word for the duratiom of its life the it is saved as a string, so when a game or word are deleted one does not affect the other

# The issue with assciating the word and game tables is what happens when the game or word are deleted?

# construct an object with name nil - should not create object
# update name from real to nil should not work
