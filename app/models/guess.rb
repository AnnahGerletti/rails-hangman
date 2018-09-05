class Guess < ApplicationRecord
  belongs_to :game
    validates :guess, presence: true
    validates :guess, length: { is: 1}
    validates :guess, format: { with: /\A[a-zA-Z]+\z/, 
    message: "only allows letters"}
    # have to be alpha characters, A - z - says  alphnumeric character has to be at the start and end of string.
    #find some validation that prevents Numbers being entered
end
