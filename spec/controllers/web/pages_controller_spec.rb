require 'spec_helper'

describe Web::PagesController do

  before do
    @page = create :page
  end

  it 'should get :index' do
    get :index
    expect(response).to be_success
  end

  it 'should get :show' do
    get :show, id: @page.slug
    expect(response).to be_success
  end

end
