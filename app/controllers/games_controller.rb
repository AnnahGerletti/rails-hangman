class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_parmas)
    @game.word = randomly_choose_word
    @game.lives = 5
    @game.save
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
    # redirect_to game_guess_path(@game.guesses)
  end

  def randomly_choose_word
    words = Word.all
    @word = words.sample
  end


  # I want to compaire the guess to the saved word
  # id the specific game 
  # need all the guess 
  # if else guesses compaired to word 
  def check_guess_against_secret
    @game.guesses.each do |guess|
    @game.word.word.includes?( ss)
  end
end

  private 

  def game_parmas
    params.require(:game).permit(:name, :word_id, :lives, )
  end
end
