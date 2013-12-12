class ProjectsController < ApplicationController
  skip_before_filter :login_required, :only => [:index, :show, :landing]
  
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }

    @features = @project.features
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @upload = Upload.find_or_create_by_id(params[:id])
    @uploadable = @project
  end

  # POST /projects
  # POST /projects.json
  def create  ### This logic needs to be abstracted
    @repo = Repo.find(params[:repo_id])
    @project = Project.new
    @project.name = @repo.name
    
    respond_to do |format|
      if @project.save
        @repo.project_id = @project.id
        @repo.save
        @project.get_description
        @project.get_technologies
        @project.get_contributors
        
        format.html { redirect_to project_path(@project), notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])
    @project.name = params[:project][:name]
    @project.description = params[:project][:description]
    
    @project.upload.destroy if @project.upload
    image = Upload.new(:image => params[:project][:image].tempfile) if params[:project][:image]
    image.save if image
    @project.upload = image

    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully updated')}
        format.json { respond_with_bip(@project)}
      else
        format.html { render :action => "edit"}
        format.json { respond_with_bip(@project)}
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def filtered
    @projects = Project.technologies(params[:tech_name])  
  end

  def landing
  end
end
