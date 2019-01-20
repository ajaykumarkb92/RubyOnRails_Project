class UsersController < ApplicationController
  before_action :require_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    # debugger
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome  #{@user.username} You have Successfully Created Your Account Please Login to view the products"
      redirect_to login_path
    else
      render 'new'
    end
  end

  def edit
    @user =User.find(params[:id])
  end

  def update
    @user =User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Your account is updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :contact_no)
    end
end
