class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      Notifications.new_user(@user).deliver
      redirect_to users_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
      @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
      redirect_to users_path
    else
      redirect_to :back, :alert => "Access denied"
    end
  end

  def suggested_friends
    @user = current_user
    @other_users = User.where.not(id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
