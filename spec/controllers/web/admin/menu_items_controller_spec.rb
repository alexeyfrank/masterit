require 'spec_helper'

describe Web::Admin::MenuItemsController do
  before do
    @user = create :user
    sign_in @user
    @menu = create :menu
    @menu_item = create :menu_item
  end

  it 'should get :index' do
    get :index
    expect(response).to be_success
  end

  it "should get :new" do
    get :new
    expect(response).to be_success
  end

  it "should post :create" do
    attrs = attributes_for :menu
    post :create, menu: attrs
    expect(response).to be_redirect
    menu = Menu.find_by_name attrs[:name]
    expect(menu).to_not be_nil
    expect(menu.description).to eq(attrs[:description])
  end

  it "should get :edit" do
    get :edit, id: @menu.id
    expect(response).to be_success
  end

  it "should put :update" do
    attrs = attributes_for :menu
    put :update, id: @menu.id, menu: attrs
    expect(response).to be_redirect
    menu = Menu.find_by_name attrs[:name]
    expect(menu).to_not be_nil
    expect(menu.description).to eq(attrs[:description])
    expect(menu.id).to eq(@menu.id)
  end

  it 'should delete :destroy' do
    delete :destroy, id: @menu.id
    expect(response).to be_redirect
    expect(Menu.exists? @menu).to be_false
  end
end
