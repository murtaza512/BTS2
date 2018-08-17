class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :setProject , only: [:edit,:show ,:update, :destroy]


  def index
    #if current_user.user_type!='developer'
    @projects=Project.page(params[:page]).per_page(5)
    #else
    #   @projects=current_user.projects
    #end

  end

  def new
    @project=Project.new

  end

  def edit

  end

  def show
    setProjectShow
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    if @project.save

        @user_project=UserProject.new(user_id:current_user.id,project_id:@project.id)
        if @user_project.save
          flash[:success] = 'project was successfully created'
        end
      redirect_to @project
    else
      #flash[:info]= 'add details'
      #flash[:danger]= "#{@project.errors.messages}"
      render 'new'
    end
  end

  def update
    authorize @project
    if @project.update(project_params)
      @user_project=UserProject.create(user_id:current_user.id,project_id:@project.id)
      flash[:success] = 'Project was successfully updated'
      redirect_to @project
    else
      #flash[:info]= 'Add details'
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    flash[:info]= 'Record Deleted'
    redirect_to projects_url
  end

  private
   def setProject
    @project=Project.find(params[:id])
   end

   def setProjectShow
    @project_bugs  =  @project.bugs
    @project_users =  @project.users
   end

  def project_params
      params.require(:project).permit(:title, :description,user_ids:[])
  end



end
