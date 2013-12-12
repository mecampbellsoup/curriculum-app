class AuthenticationsController < ApplicationController
   skip_before_filter :authorize
  # GET /authentications
  # GET /authentications.json
  def index
    @authentications = current_user.authentications if current_user

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @authentications }
    end
  end

  def show
    @authentication = Authentication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @authentication }
    end
  end


  def new
    @authentication = Authentication.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @authentication }
    end
  end

  # GET /authentications/1/edit
  def edit
    @authentication = Authentication.find(params[:id])
  end

  def create
    # debugger
     # render :text => request.env["omniauth.auth"].to_yaml
    auth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
    # debugger
    if authentication
      flash[:notice] = "Signed in successfully"
      sign_in(authentication.user)
      redirect_to root_url
    elsif current_user
      current_user.authentications.create(:provider => auth['provider'], :uid => auth['uid'])
      current_user.email = auth['info']['email'] unless current_user.email
      current_user.image_url = auth['info']['image'] unless current_user.image_url
      current_user.save!
      flash[:notice] = "Authentication successful."
      sign_in(authentication.user)
      redirect_to root_url
    else
      user = User.find_or_create_by_email(auth['info']['email'])
      user.authentications.build(:provider => auth['provider'], :uid => auth['uid'])
      user.image_url = auth['info']['image'] unless user.image_url
      user.username = auth["info"]["name"] unless user.username
      user.save!
      flash[:notice] = "Signed in successfully"
      sign_in(user)
      redirect_to root_url
    end
  end


  def update
    @authentication = Authentication.find(params[:id])

    respond_to do |format|
      if @authentication.update_attributes(params[:authentication])
        format.html { redirect_to @authentication, notice: 'Authentication was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @authentication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authentications/1
  # DELETE /authentications/1.json
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end
