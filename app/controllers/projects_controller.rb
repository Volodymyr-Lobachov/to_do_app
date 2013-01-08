class ProjectsController < ApplicationController
  # GET users/1/projects
  # GET users/1/projects.json
  def index
    @user = User.find(params[:user_id])
    @projects = @user.projects

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @projects }
    end
  end

  # GET users/1/projects/1
  # GET users/1/projects/1.json
  def show
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @project }
    end
  end

  # GET users/1/projects/new
  # GET users/1/projects/new.json
  def new
    @user = User.find(params[:user_id])
    @project = @user.projects.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @project }
    end
  end

  # GET users/1/projects/1/edit
  def edit
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:id])
  end

  # POST users/1/projects
  # POST users/1/projects.json
  def create
    @user = User.find(params[:user_id])
    @project = @user.projects.build(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to([@project.user, @project], :notice => 'Project was successfully created.') }
        format.json { render :json => @project, :status => :created, :location => [@project.user, @project] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT users/1/projects/1
  # PUT users/1/projects/1.json
  def update
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to([@project.user, @project], :notice => 'Project was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE users/1/projects/1
  # DELETE users/1/projects/1.json
  def destroy
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to user_projects_url(user) }
      format.json { head :ok }
    end
  end
end
