class HorsesController < ApplicationController
  def show
    @horse = Horse.find(params[:id])
  end

  def new
    @horse = Horse.new
  end

  def create
    @horse = Horse.new(params[:horse])

    if @horse.save
      format.html redirect_to @horse, notice: 'Horse was successfully created.'
    else
      format.html { render action: "new" }
    end
  end
end
