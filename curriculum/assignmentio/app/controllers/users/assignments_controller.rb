# class Users::AssignmentsController < ActionController::Base
#   #get /users/:user_id/assignments
#   def index
#     @user = User.find(params[:user_id])
#   end
#   #get /users/:user_id/assignments/:assignment_id/edit
#   def edit
#     @user_assignment = UserAssignment.find_by_user_id_and_assignment_id(params["user_id"],params["id"])
#     @assignment = Assignment.find params["id"]
#     @user = User.find params["user_id"]
#   end
#   def show
#     @assignment = Assignment.find params["id"]
#     @user = User.find params["user_id"]
#   end
#   #post /users/:user_id/assignments/:assignment_id/edit
#   def update
#     @user_assignment = UserAssignment.find_by_user_id_and_assignment_id(params["user_id"],params["id"])
#     respond_to do |format|
#       if @user_assignment.update_attributes(params[:user_assignment])
#         format.html { redirect_to user_assignments_path(@user_assignment.user_id), notice: 'Assignment was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @assignment.errors, status: :unprocessable_entity }
#       end
#     end
#   end
# end