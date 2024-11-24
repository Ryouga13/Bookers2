class UsersController < ApplicationController
  def index
    @user_all = User.all
    @book = Book.new
    @user_id = current_user
  end

  def show
    @user_show = Book.all
    @user_show.user_id = current_user.id
    @book = Book.new
    @user_id = current_user
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
