class Game < ApplicationRecord
  has_many :guesses 
  belongs_to :word
end
