class UsersController < ApplicationController
  def index
    @user_all = User.all
  end

  def show
    @user_id = User.find(params[:id])
 
  end

  def edit
    @user_edit = User.find(params[:id])
  end

  def update
    @user_edit = User.find(params[:id])
    @user_edit.update(user_params)
    redirect_to "/users/#{@user_edit.id}"
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
