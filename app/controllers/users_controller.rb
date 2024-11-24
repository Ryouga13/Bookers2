class UsersController < ApplicationController
  def index
    @user_all = User.all
    @book = Book.new
    @user_id = current_user
  end

  def show
    @user_show = User.find(params[:id])
    @book = Book.new
    @user_id = User.find(params[:id])
  end

  def edit
    @user_edit = User.find(params[:id])
  end

  def update
    @user_edit = User.find(params[:id])
    if @user_edit.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to "/users/#{@user_edit.id}"
      end
    
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
