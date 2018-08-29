class Guess < ApplicationRecord
  belongs_to :game 
  # if you put a belongs_to in the db do you need this belong_to
end
