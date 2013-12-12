class FeaturesController < ApplicationController
  skip_before_filter :login_required, :only => [:index, :show, :edit, :update_slide_order]
  
  # GET /users/1/features
  # GET /users/1/features.json
  def index
    @project = Project.find(params[:project_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @features }
    end
  end

  # GET /users/1/features/1
  # GET /users/1/features/1.json
  def show
    @feature = Feature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feature }
    end
  end

  # GET /users/1/features/new
  # GET /users/1/features/new.json
  def new
    @project = Project.find(params[:project_id])
    @technologies = Technology.all
    @feature = Feature.new

    redirect_to current_user if !current_user.can?(:edit, @project)
  end

  # GET /users/1/features/1/edit
  def edit
    @feature = Feature.find(params[:id])
    @technologies = Technology.all

    redirect_to current_user if !current_user.can?(:edit, @feature)
  end

  def update_slide_order
    params["slides"].each do |index, slide_hash|
      slide = slide_hash["class"].constantize.find(slide_hash["id"])
      slide.position = index
      slide.save
    end
    # {"slides"=>{"0"=>{"class"=>"Snippet", "id"=>"1"}, "1"=>{"class"=>"Snippet", "id"=>"1"}}, "feature_id"=>"41"}
  end

  # POST /users/1/features
  # POST /users/1/features.json
  def create
    @project = Project.find(params[:project_id])
    @feature = Feature.new(params[:feature])
    @user_project = UserProject.where(:project_id => params[:project_id], :user_id => current_user.id).first
    @feature.user_project_id = @user_project.id

    respond_to do |format|
      if @feature.save
        format.html { redirect_to new_feature_slide_path(@feature), notice: 'Feature was successfully created.' }
        format.json { render json: @feature, status: :created, location: @feature }
      else
        @technologies = Technology.all
        format.html { render action: "new" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1/features/1
  # PUT /users/1/features/1.json
  def update
    if params[:slides] 
      params[:slides].each_with_index do |slide, index|
        snippet_or_upload = slide[:class].constantize.find(slide[:id])
        snippet_or_upload.position = index
        snippet_or_upload.save
      end
    end
    @feature = Feature.find(params[:id])

    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html { redirect_to feature_path(@feature), notice: 'Feature was successfully updated.' }
        format.json { respond_with_bip(@feature)}
      else
        format.html { render action: "edit" }
        format.json { render json: @feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1/features/1
  # DELETE /users/1/features/1.json
  def destroy
    @feature = Feature.find(params[:id])
    current_user.can?(:destroy, @feature) ? @feature.destroy : redirect_to(current_user)

    respond_to do |format|
      format.html { redirect_to user_path(@feature.user) }
      format.json { head :no_content }
    end
  end
end