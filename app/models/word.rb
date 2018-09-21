class Word < ApplicationRecord
  validates :word, :word, :presence => true

  before_destroy :ensure_database_has_one_word
  # before the destroy occures the Word model will call the method ensure_database_has_one_word

  private

  def ensure_database_has_one_word
    if Word.count == 1
      errors.add(:base, 'cannot delete last word')
      throw(:abort)
    end
  end
end

#test: weather these errors are present, test whether method is called, test whether there are errors 


# This method will check the DB to see how many words are pressernt if word count = 1 then it will abort the delete and throw the error.





# can't have a game with out a word 
# so what if all words were deleted from word bank and then a game is played 
# need some validation to make sure there is always one word
# validate says that game can't be started without a word in bank
# Game belongs to word  and a word has many games
