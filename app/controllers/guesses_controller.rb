# frozen_string_literal: true

class GuessesController < ApplicationController
  # Not using Index or new, using game to access guess table, look at the forms see what model you are passing in.
  # def index
  #   @guesses = Guess.all
  # end

  # def new
  #   @guess = Guess.new
  # end

  def create
    @game = Game.find(params[:game_id])
    @guess = @game.guesses.new(guess_params)
    if @guess.save
      redirect_to @game
    else
      flash[:notice] = 'Please enter single letters only'
      # an alert message
      redirect_to @game
      # refreshes the page
    end
  end

  private

  def guess_params
    params.require(:guess).permit(:guess, :game_id)
  end
end
