class Web::SessionsController < Web::ApplicationController

  layout "web/admin/login"

  def new
    @type = ::Web::UserSignInType.new
  end

  def create
    @type = ::Web::UserSignInType.new params[:web_user_sign_in_type]
    if @type.valid?
      user = @type.user
      sign_in user
      flash_success
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end
end
