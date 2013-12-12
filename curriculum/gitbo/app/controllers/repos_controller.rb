class ReposController < ApplicationController
  # GET /repos
  # GET /repos.json
  
  def index
    @repos = Repo.all
    @repo_new = Repo.new
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: ReposDatatable.new(view_context) }
    end
  end

  def show_owner
    @repos = Repo.find_all_by_owner_name(params[:owner])
  end

  # GET /repos/1
  # GET /repos/1.json
  def show
    @repo = Repo.find_by_owner_name_and_name(params[:owner], params[:repo])
    if @repo.nil?
      flash[:error] = "#{params[:owner]}'s repo \"#{params[:repo]}\" doesn't exist on Gitbo, consider uploading it below."
      redirect_to :action => "index"
    else

      @issues = @repo.issues

      #check to see if there are any updates to the repo
      #if there are updates, make a call to update the repo, its issues, and any
      #comments associated.
      
      if current_user
        RefreshReposWorker.perform_async(@repo.id, current_user.token)
      end
    
        #maybe autorefresh non missing issues?

        #missing numbers should be imported || refreshed

          # updated_issues.each do |issue|
          #     issue.refresh || issue.create_from_github(@repo.owner_name, @repo.name, issue.git_number)
          # end 
      
      # we will want to refresh the page soon as this code executes
      #because new issues have been updated/added to the page.
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @repo }
      end
    end
  end

  # GET /repos/new
  # GET /repos/new.json
  def new

    @repo = Repo.new
    1.times { @repo.issues.build}

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @repo }
    end
  end

  # GET /repos/1/edit
  def edit
    @repo = Repo.find(params[:id])
  end

  # POST /repos
  # POST /repos.json
  def create

    #don't run this job if the repo already exists
    #if there is already a repo with this name in the db, we know
   
      if !Repo.find_by_name(params[:repo][:name])
        owner = params[:repo][:owner_name]
        repo_name = params[:repo][:name]
        repo = Repo.new(:owner_name => owner, :name => repo_name,
                       :watchers => 0, :open_issues => 0 )
        if repo.exists_on_github?(current_user.token)
          repo.save
          RepoWorker.perform_async(repo.id, current_user.token)
          flash[:notice] = 'Your repository and corresponding issues are being processed, please check back shortly'
          redirect_to :root
        else
          flash_repo_not_found
        end
      else
        flash[:error] = "Repository already exists."
        redirect_to :back
      end

    

    # respond_to do |format|
    #   if @repo.save
    #     format.html { redirect_to @repo, notice: 'Repo was successfully created.' }
    #     format.json { render json: @repo, status: :created, location: @repo }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @repo.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /repos/1
  # PUT /repos/1.json
  def update
    @repo = Repo.find(params[:id])

    respond_to do |format|
      if @repo.update_attributes(params[:repo])
        format.html { redirect_to @repo, notice: 'Repo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repos/1
  # DELETE /repos/1.json
  def destroy
    @repo = Repo.find(params[:id])
    @repo.destroy

    respond_to do |format|
      format.html { redirect_to repos_url }
      format.json { head :no_content }
    end
  end

  private

  def flash_repo_not_found
    flash[:error] = "Repository not found on Github. Check your spelling and try again."
    redirect_to :back
  end

end
