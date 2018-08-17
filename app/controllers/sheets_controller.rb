class SheetsController < ApplicationController

    before_action :setSheet , only: [:edit,:show ,:update, :destroy]


  def index
    #if current_user.user_type!='developer'
    @sheets=Sheet.all
    #else
    #   @Sheets=current_user.Sheets
    #end

  end

  def new
    @sheet=Sheet.new

  end

  def edit

  end

  def show
  end

  def create
    @sheet = Sheet.new(sheet_params)
    if @sheet.save
      flash[:success] = 'Sheet was successfully created'
      redirect_to @sheet
    else
      #flash[:info]= 'add details'
      #flash[:danger]= "#{@Sheet.errors.messages}"
      render 'new'
    end
  end

  def update
    if @sheet.update(sheet_params)
      flash[:success] = 'Sheet was successfully updated'
      redirect_to @sheet
    else
      #flash[:info]= 'Add details'
      render 'edit'
    end
  end

  def destroy
    @sheet.destroy
    flash[:info]= 'Record Deleted'
    redirect_to sheets_url
  end

  private
   def setSheet
    @sheet=Sheet.find(params[:id])
   end



  def sheet_params
      params.require(:sheet).permit(:user_id,{image: []})
  end



end
