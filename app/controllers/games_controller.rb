class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_parmas)
    @game.word = randomly_choose_word
    @game.lives = 6
     if @game.save
      redirect_to game_path(@game)
     else
      render :new
     end
  end

  def show
    @game = Game.find(params[:id])
    # redirect_to game_guess_path(@game.guesses)
  end

  def randomly_choose_word
    words = Word.all
    @word = words.sample
  end

  def check_guess_against_secret
    @game.guesses.each do |guess|
      @game.word.word.includes?(guess)
    end
  end


  private 

  def game_parmas
    params.require(:game).permit(:name, :word_id, :lives)
  end
end
