require 'spec_helper'

describe Web::Admin::Menu::ItemsController do
  before do
    @user = create :user
    sign_in @user
    @menu = create :menu
    @menu_item = create :item, menu: @menu
  end

  it 'should get :index' do
    get :index, menu_id: @menu.id
    expect(response).to be_success
  end

  it "should get :new" do
    get :new, menu_id: @menu.id
    expect(response).to be_success
  end

  it "should post :create" do
    attrs = attributes_for :item
    post :create, menu_id: @menu.id, menu_item: attrs
    expect(response).to be_redirect
    item = Menu::Item.find_by_name attrs[:name]
    expect(item).to_not be_nil
  end

  it "should get :edit" do
    get :edit, menu_id: @menu.id, id: @menu_item.id
    expect(response).to be_success
  end

  it "should put :update" do
    attrs = attributes_for :item
    put :update, menu_id: @menu.id, id: @menu_item.id, menu_item: attrs
    expect(response).to be_redirect
    item = Menu::Item.find_by_name attrs[:name]
    expect(item).to_not be_nil
    expect(item.id).to eq(@menu_item.id)
  end

  it 'should delete :destroy' do
    delete :destroy, menu_id: @menu.id, id: @menu_item.id
    expect(response).to be_redirect
    expect(Menu::Item.exists? @menu_item).to be_false
  end
end
