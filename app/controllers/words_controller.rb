class WordsController < ApplicationController
  # def new
   

  def index 
    @words = Word.all
  end


  def create 
    @word = Word.new(word_params)
    @word.save
    redirect_to words_index_path
  end

  def destroy
    @word = Word.find(params[:id])
    if @word.destroy
      redirect_to words_index_path
    else
      flash[:notice] = 'Cannot delete last word'
      redirect_to words_index_path
    end
  end


  private 
  def word_params
    params.require(:word).permit(:word)
  end

end


