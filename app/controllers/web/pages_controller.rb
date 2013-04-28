class Web::PagesController < Web::ApplicationController
  def index
    @main_page = true
  end

  def show
    @page = Page.find_by_slug! params[:id]
  end

  private
  def main_page?
    @main_page ||= false
  end
end
