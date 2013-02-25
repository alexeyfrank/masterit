require 'spec_helper'

describe Web::SessionsController do
  before do
    @user = create :user
    @params = { email: @user.email, password: '12345' }
  end

  it 'should get new' do
    get :new
    expect(response).to be_success
  end

  it 'should post create' do
    post :create, web_user_sign_in_type: @params
    expect(response).to be_redirect
    expect(signed_in?).to be_true
    expect(current_user.email).to eq(@user.email)
  end

  it 'should delete destroy' do
    delete :destroy
    expect(response).to be_redirect
    expect(signed_in?).to be_false
    expect(current_user).to be_nil
  end

end
