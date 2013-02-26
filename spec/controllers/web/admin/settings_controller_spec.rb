require 'spec_helper'

describe Web::Admin::SettingsController do

  before do
    @user = create :user
    sign_in @user
  end

  it 'should get :new' do
    get :new
    expect(response).to be_success
  end
end
