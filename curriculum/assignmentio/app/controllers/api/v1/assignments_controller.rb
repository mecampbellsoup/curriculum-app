class Api::V1::AssignmentsController < Api::V1::BaseController
  
  def index
    respond_with(Assignment.all)
  end
  
  def create
    @assignment = Assignment.new(params[:assignment].except(:emails))
    @user = User.find_by_authentication_token(params[:authentication_token])

    if @user && @assignment.save
      @assignment.user_names = params[:assignment][:emails]
      @assignment.author = @user
      respond_with(@assignment, :location=> api_v1_assignment_path(@assignment))
    elsif @user 
      respond_with(@assignment)
    else
      render :json => {:error => "Must be authenticated"}
    end
  end

  def show
    @assignment = Assignment.find(params[:id])
    respond_with(@assignment)
  end
  def help
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @users.as_json(:only => [:name, :id, :email]) }
    end
  end
end

