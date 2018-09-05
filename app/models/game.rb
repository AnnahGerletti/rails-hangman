class Game < ApplicationRecord
  has_many :guesses
  belongs_to :word
    validates :name, presence: true
end
