module Web::MenuHelper
  def render_menu(params)
    # @items = MenuItem.where(menu_id: params[:id]).order(:position).roots
    @items = Item.to_tree params[:id]
    render params[:template] #, menu: @menu
  end
  
  def menu_item_class(menu_item)
    current_page?(show_page_path(menu_item.slug)) ? 'active' : ''
  end
end