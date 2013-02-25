require 'spec_helper'

describe Web::Admin::PagesController do

  before do
    @user = create :user
    sign_in @user
    @page = create :page
  end

  it "should get index" do
    get :index
    expect(response).to be_success
  end

  it "should get new" do
    get :new
    expect(response).to be_success
  end

  it "should post create" do
    params = attributes_for :page
    post :create, page: params
    expect(response).to be_redirect
    page = Page.find_by_title(params[:title])
    expect(page).to_not be_nil
    expect(page.content).to eq(params[:content])
  end

  it "should get edit" do
    get :edit, id: @page.id
    expect(response).to be_success
  end

  it "should put update" do
    params =  attributes_for :page
    put :update, id: @page.id, page: params
    expect(response).to be_redirect
    page = Page.find_by_title params[:title]
    expect(page).to_not be_nil
  end

  it "should delete destroy" do
    delete :destroy, id: @page.id
    expect(response).to be_redirect
    expect(Page.exists? @page.id).to be_false
  end

end
