class SongsController < ApplicationController
  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(params[:song])
    if @song.save
      redirect_to @song, notice: 'Song was successfully created.'
    else
      render action: "new"
    end
  end
end