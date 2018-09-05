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
    if @guess.id
      redirect_to @game
    else
      flash[:notice] = "Please enter single letters only"
      #an alert message
      redirect_to @game
      #refreshes the page 
    end
  end


  private 
  def guess_params
    params.require(:guess).permit(:guess, :game_id)
  end


end
