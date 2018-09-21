module GamesHelper
  def dashes
    @game.word.chars.map do |char|
      if @game.guesses.map(&:guess).include?(char)
        char
      else 
         '#'
      end
    end.join(' ')
  end
  
  def show_word
    @game.word if lost?
  end

  def lives_left
    lives = @game.lives 
    
    @game.guesses.each do |guess|
      if !(@game.word.include?(guess.guess))
        lives = lives - 1
      end
    end
    lives
  end

  def lost? 
    lives_left.zero?
  end

  def won?
    # access game db and save false in the won loss column
    # change the db boolean from loss to won 
    secret = @game.word
    guess = @game.guesses.pluck(:guess)

    secret.chars.map.all? do |char|
      guess.include?(char)
    end
  end


  def game_output
    if lost?
      'Game Over'
    elsif won?  
      "Congratulations You WIN!!!"
    else
      "Keep Guessing"
    end
  end

  def new_game
    # askes if want to play again
    # starts the game over again
    # hits the create method
    # keeps same name, but new instance of game id, new word and new guesses 
    # add a link when the game is over back to start game page
    # sessions LOOK UP 
    # pass it the same information have to build it differently, needs the same infor the current game already has 
  end

end

