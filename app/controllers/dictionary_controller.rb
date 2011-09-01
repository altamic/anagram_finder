class DictionaryController < ApplicationController
  def show
    @dictionary = Dictionary.last
  end

  def new
    @dictionary = Dictionary.new
  end

  def create
    @dictionary = Dictionary.new(params[:dictionary])
    if @dictionary.save
      redirect_to root_path, :notice => 'Dictionary has been uploaded'
    else
      render 'new'
    end
  end
end

