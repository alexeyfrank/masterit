module Web::MenuHelper

  def main_menu_id
    1
  end

  def has_left_menu?
    @menu ||= Menu.find main_menu_id
    slug = request.fullpath[1..-1]
    item = @menu.items.find_by_slug slug
    sub_items(item).present?
  end

  def top_menu_items
    @menu ||= Menu.find main_menu_id
    @items ||= @menu.items.roots
    #render 'web/shared/top_menu'
  end

  def left_menu
    @menu ||= Menu.find main_menu_id
    slug = request.fullpath[1..-1]
    item = @menu.items.find_by_slug slug
    @sub_items = sub_items(item)
    render 'web/shared/left_menu'
  end

  def sub_items(item)
    if item
      if item.has_children?
        item.children
      elsif item.has_siblings? && !item.is_root?
        item.siblings
      else
        nil
      end
    else
      nil
    end
  end

  def menu_item_class(menu_item)
    current_page?(show_page_path(menu_item.slug)) ? 'active' : ''
  end
end