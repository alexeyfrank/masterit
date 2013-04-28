class Web::Admin::Menu::ItemsController < Web::Admin::ApplicationController
  layout false, only: [:new, :edit]

  def index
    @menu = get_menu
    @items = @menu.items.web.roots
  end

  def new
    @menu = get_menu
    @item = Menu::Item.new
  end

  def create
    @menu = get_menu
    @item = Menu::Item.new params[:menu_item]
    @item.menu = @menu
    if @item.save
      flash_success
    else
      flash_error
    end
    redirect_to admin_menu_items_path(@menu)
  end

  def edit
    @menu = get_menu
    @item = @menu.items.find params[:id]
  end

  def update
    @menu = get_menu
    @item = @menu.items.find params[:id]

    if @item.update_attributes params[:menu_item]
      flash_success
    else
      flash_error
    end
    redirect_to admin_menu_items_path(@menu)
  end

  def destroy
    @item = get_menu.items.find params[:id]
    @item.destroy
    flash_success
    redirect_to admin_menu_items_path
  end

  private
  def get_menu
    @menu ||= Menu.find params[:menu_id]
  end
end
