class BugsController < ApplicationController
    before_action :authenticate_user!

  before_action :setBug , only: [:edit,:show ,:update, :destroy]

  def index
    @bugs=Bug.all
  end

  def new
    @bug=Bug.new(bug_params)
  end

  def edit
  end

  def show
  end

  def create
    @bug = Bug.new(bug_params)
    authorize @bug

    if @bug.save
      flash[:success] = 'Record created successfully'
      redirect_to @bug
    else
      flash[:danger]= 'add details'
      render 'new'
    end
  end

  def update
    authorize @bug

    if @bug.update(bug_params)
      flash[:success] = 'Updation was successfully'
      redirect_to @bug
    else
      flash[:danger]= 'add details'
      render 'edit'
    end
  end

  def destroy
    @bug.destroy
    flash[:info]='record deleted'
    redirect_to bugs_url
  end


  def assign_bug

    @bug=Bug.find(params[:id])
    user_id=current_user.id
    @bug.developer_id=user_id
     if @bug.save
        flash[:success] = 'Updation was successfully'
     else
        flash[:error] = 'Updation was unsuccessful'
     end
  end


  def mark_bug

    @bug=Bug.find(params[:id])
    if(@bug.types=='bug')
      @bug.status='resolved'
    else
       @bug.status='completed'
    end

     if @bug.save
        flash[:success] = 'Updation was successfully'
     else
        flash[:error] = 'Updation was unsuccessful'
     end
  end

  private
   def setBug
    @bug=Bug.find(params[:id])
   end

   # Never trust parameters from the scary internet, only allow the white list through.
    def bug_params
      params.require(:bug).permit(:title,:deadline,:screenshot,:types,:status,:project_id,:user_id)
    end
end
