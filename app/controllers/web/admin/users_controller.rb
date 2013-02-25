class Web::Admin::UsersController < Web::Admin::ApplicationController

  def index
    @users = User.web
  end

  def new
    @user = ::Web::Admin::UserEditType.new
  end

  def create
    @user = ::Web::Admin::UserEditType.new params[:user]
    if @user.save
      flash_success
      redirect_to edit_admin_user_path(@user)
    else
      flash_error
      render :new
    end
  end

  def edit
    @user = ::Web::Admin::UserEditType.find params[:id]
  end

  def update
    @user = ::Web::Admin::UserEditType.find(params[:id])
    if @user.update_attributes params[:user]
      flash_success
      redirect_to edit_admin_user_path(@user)
    else
      flash_error
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash_success
    redirect_to admin_users_path
  end
end
