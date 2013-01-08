class TasksController < ApplicationController
  # GET projects/1/tasks
  # GET projects/1/tasks.json
  def index
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:project_id])
    @tasks = @project.tasks

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end

  # GET projects/1/tasks/1
  # GET projects/1/tasks/1.json
  def show
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @task }
    end
  end

  # GET projects/1/tasks/new
  # GET projects/1/tasks/new.json
  def new
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:project_id])
    @task = @project.tasks.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @task }
    end
  end

  # GET projects/1/tasks/1/edit
  def edit
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
  end

  # POST projects/1/tasks
  # POST projects/1/tasks.json
  def create
    @user    = User.find(params[:user_id])
    @project = @user.projects.find(params[:project_id])
    @task    = @project.tasks.build(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to([@user,@project, @task], :notice => 'Task was successfully created.') }
        format.json { render :json => @task, :status => :created, :location => [@task.project, @task] }
      else
        format.html { render :action => "new" }
        format.json { render :json => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT projects/1/tasks/1
  # PUT projects/1/tasks/1.json
  def update
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to([@task.project, @task], :notice => 'Task was successfully updated.') }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE projects/1/tasks/1
  # DELETE projects/1/tasks/1.json
  def destroy
    @user = User.find(params[:user_id])
    @project = @user.projects.find(params[:project_id])
    @task = @project.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to project_tasks_url(project) }
      format.json { head :ok }
    end
  end
end
