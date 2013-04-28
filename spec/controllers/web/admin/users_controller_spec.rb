require 'spec_helper'

describe Web::Admin::UsersController do

  before do
    @user = create :user
    sign_in @user
    @attrs = attributes_for :user
  end

  it 'should get :index' do
    get :index
    expect(response).to be_success
  end

  it 'should get :new' do
    get :new
    expect(response).to be_success
  end

  it 'should post :create' do
    post :create, user: @attrs
    expect(response).to be_redirect
    user = User.find_by_email(@attrs[:email])
    expect(user).to_not be_nil
  end

  it 'should put :update' do
    put :update, id: @user.id, user: @attrs
    user = User.find(@user)
    expect(user.email).to eq(@attrs[:email])
    expect(response).to be_redirect
  end

  it 'should delete :destroy' do
    delete :destroy, id: @user.id
    expect(response).to be_redirect
    expect(User.exists? @user).to be_false
  end
end
