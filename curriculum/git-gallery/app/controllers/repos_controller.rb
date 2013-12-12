class ReposController < ApplicationController
  
  def show
  	@repo = Repo.find(params[:id])
  end

end