class RacesController < ApplicationController
  def show
    @race = Race.find(params[:id])
  end

  def new
    @race = Race.new
  end

  def create
    @race = Race.new()
    @race.name = params[:race][:name]
    @race.description = params[:race][:description]

    params[:horse_attributes].each do |attributes|
      horse = Horse.new()
      horse.name = attributes[:name]
      horse.number = attributes[:number]
      horse.position = attributes[:position]

      @race.horses << horse
    end

    params[:jockey_attributes].each do |attributes|
      jockey = Jockey.new()
      jockey.name = attributes[:name]
      jockey.height = attributes[:height]
      jockey.shoe_size = attributes[:shoe_size]

      @race.jockeys << jockey
    end

    if @race.save
      redirect_to @race, notice: 'Race was successfully created.'
    else
      render action: "new"
    end
  end
end
