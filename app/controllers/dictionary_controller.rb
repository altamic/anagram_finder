class DictionaryController < ApplicationController
  def show
    if params[:search].nil?
      @word, @words = params[:search], []
    else
      @word = params[:search]
      @words = Dictionary.find_anagram(params[:search])
    end
  end

  def new
    @dictionary = Dictionary.new
  end

  def create
    @dictionary = Dictionary.new(params[:dictionary])
    if @dictionary.save && @dictionary.save_index
      redirect_to root_path, :notice => 'Dictionary has been uploaded'
    else
      render 'new'
    end
  end
end

