class Web::Admin::MenusController < Web::Admin::ApplicationController
  def index
    @menus = Menu.web
  end

  def new
    @menu = ::Web::Admin::MenuEditType.new
  end

  def create
    @menu = ::Web::Admin::MenuEditType.new params[:menu]
    if @menu.save
      flash_success
      redirect_to edit_admin_menu_path(@menu)
    else
      flash_error
      render :new
    end
  end

  def edit
    @menu = ::Web::Admin::MenuEditType.find params[:id]
  end

  def update
    @menu = ::Web::Admin::MenuEditType.find params[:id]
    if @menu.update_attributes params[:menu]
      flash_success
      redirect_to edit_admin_menu_path(@menu)
    else
      flash_error
      render :edit
    end
  end

  def destroy
    @menu = Menu.find params[:id]
    @menu.destroy
    flash_success
    redirect_to admin_menus_path
  end
end
