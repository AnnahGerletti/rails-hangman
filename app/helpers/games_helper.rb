module GamesHelper
  def dashes
    @game.word.word.chars.map do |char|
      if @game.guesses.map(&:guess).include?(char)
        char
      else 
         '#'
      end
    end.join(' ')
  end

  def lives_left
    lives = @game.lives 
    
    @game.guesses.each do |guess|
      if !(@game.word.word.include?(guess.guess))
        lives = lives - 1
      end
    end
   lives
  end


   def lost? 
    lives_left.zero?
   end
  # def lives_countergame
  #   if @game.guesses! 
  # end


  #  def won?
  #   @game.word.word.all? do |char|
  #     @game.guesses.map(&:guess).include?(char)
  #   end
  # end


end

