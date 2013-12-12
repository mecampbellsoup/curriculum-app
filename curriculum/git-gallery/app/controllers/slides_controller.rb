class SlidesController < ApplicationController
  def new
    @feature = Feature.find(params[:feature_id])
  end
end