class WordsController < ApplicationController
  
  def index 
    @word = Word.new
    @words = Word.all
  end


  def create 
    @word = Word.new(word_params)
    @word.save
    redirect_to words_index_path
  end

  def destroy
    @word = Word.find(params[:id])
    @word.delete
    redirect_to words_index_path
  end


  private 
  def word_params
  params.require(:word).permit(:word)
  end

end

  # def create
  #   @article = Article.new(article_params)
  #   @article.save
  #   redirect_to articles_index_path
  # end
  # def article_params
  #   params.require(:article).permit(:title, :text)
  # end
