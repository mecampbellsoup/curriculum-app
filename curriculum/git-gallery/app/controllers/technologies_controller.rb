class TechnologiesController < ApplicationController
  skip_before_filter :login_required, :only => [:show]
  # GET /users/1/technologies/1
  # GET /users/1/technologies/1.json
  def show
    @technology = Technology.find(params[:id])
    @user = User.find(params[:user_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @technology }
    end
  end
end