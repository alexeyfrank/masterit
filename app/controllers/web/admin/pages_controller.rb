class Web::Admin::PagesController < Web::Admin::ApplicationController
  def index
    @pages = Page.web
  end

  def new
    @page = ::Web::Admin::PageEditType.new
  end

  def create
    @page = ::Web::Admin::PageEditType.new params[:page]
    if @page.save
      flash_success
      redirect_to edit_admin_page_path(@page)
    else
      flash_error
      render :new
    end
  end

  def edit
    @page = ::Web::Admin::PageEditType.find_by_slug! params[:id]
  end

  def update
    @page = ::Web::Admin::PageEditType.find_by_slug! params[:id]
    if @page.update_attributes params[:page]
      flash_success
      redirect_to edit_admin_page_path(@page)
    else
      flash_error
      render :edit
    end
  end

  def destroy
    @page = Page.find_by_slug! params[:id]
    @page.destroy
    flash_success
    redirect_to admin_pages_path
  end
end
