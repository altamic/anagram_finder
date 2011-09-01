class DictionaryController < ApplicationController
  def show
    @dictionary = Dictionary.first
  end

  def new
    @dictionary = Dictionary.new
  end

  def create
    @dictionary = Dictionary.new(params[:dictionary])
    if @dictionary.save
      redirect_to @upload, :notice => 'Dictionary upload successful'
    else
      render 'new'
    end
  end
end

