class Assignments::UsersController < ActionController::Base
  def show
    @user = User.find(params[:id])
  end
  def index
    @assignment = Assignment.find(params["assignment_id"])
  end
end