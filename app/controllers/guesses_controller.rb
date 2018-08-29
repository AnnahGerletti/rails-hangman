class GuessesController < ApplicationController
  def index
    @guesses = Guess.all
  end
  
  def new 
    @guess = Guess.new
  end

  def create 
    @game = Game.find(params[:game_id])
    @guess = @game.guesses.create(guess_params)
    redirect_to @game
  end


  private 
  def guess_params
    params.require(:guess).permit(:guess, :game_id)
  end


end

#Why does hiting New game button, it take you to the guess controller and not the game contreoller
#Find some literature that explains when tables belong to other tables
#Create needs a redirect to show all the guess letters, then it needs some logic that 