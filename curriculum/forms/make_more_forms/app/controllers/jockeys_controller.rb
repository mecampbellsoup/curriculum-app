class JockeysController < ApplicationController
  def new
    @jockey = Jockey.new
  end

  def create
    @jockey = Jockey.new(params[:jockey])

    if @jockey.save
      redirect_to @jockey, notice: 'Jockey was successfully created.'
    else
      render action: "new"
    end
  end
end