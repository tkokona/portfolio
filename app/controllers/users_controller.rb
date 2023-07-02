class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @exams = @user.exams
  end

  def edit
    @user = User.find(params[:id])
    unless @user ==current_user
      @user = current_user
      redirect_to user_path(@user)
    end
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = '更新完了'
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :major, :introduction, :profile_image)
  end
  
end
