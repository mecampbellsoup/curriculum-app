class ArtistsController < ApplicationController
  def show
    @artist = Artist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end

  def new
    @artist = Artist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artist }
    end
  end

  def create
    # TODO: fill me in!

    if @artist.save
      redirect_to @artist, notice: 'Artist was successfully created.'
    else
      format.html { render action: "new" }
    end
  end
end
