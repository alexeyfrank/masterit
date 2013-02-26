module Web::MenuHelper
  def render_menu(params)
    @items = Menu::Item.to_tree params[:id]
    render params[:template]
  end
  
  def menu_item_class(menu_item)
    current_page?(show_page_path(menu_item.slug)) ? 'active' : ''
  end
end