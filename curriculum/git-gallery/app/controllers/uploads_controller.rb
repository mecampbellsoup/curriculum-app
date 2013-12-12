class UploadsController < ApplicationController
  before_filter :load_uploadable

  def index
    @uploads = @uploadable.uploads
  end

  def show
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = @uploadable.uploads.new
    if User.where(:id => params[:user_id]).count > 0
      @user = User.find(params[:user_id])
    else
      @user = nil
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = @uploadable.uploads.new(params[:upload])
    @upload.position = @uploadable.snippets.size + @uploadable.uploads.size - 1 if @uploadable.class.name == "Feature"
    #IF COMING FROM PROJECT, REDIRECT TO PROJECT SHOW; IF COMING FROM USER/FEATURE, REDIRECT TO FEATURE SHOW
    if @upload.save
      if @uploadable.class.name == "Feature"
        redirect_to new_feature_slide_path(@uploadable), notice: 'Last slide was successfully created.'
      else
        redirect_to project_path(@uploadable)
      end
    else
      render :new
    end
    
    # @upload.location_dependent_save(@uploadable)
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])
    
    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @uploadable, notice: 'upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = Upload.find(params[:id])
    uploadable = @upload.uploadable
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploadable }
      format.json { head :no_content }
    end
  end

private

  def load_uploadable
    klass = [Project, Feature].detect {|c| params["#{c.name.underscore}_id"]}
    # raise klass.find(params["#{klass.name.underscore}_id"])
    @uploadable = klass.find(params["#{klass.name.underscore}_id"])
  end
end
