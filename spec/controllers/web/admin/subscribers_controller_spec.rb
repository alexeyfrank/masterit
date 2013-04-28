require 'spec_helper'

describe Web::Admin::SubscribersController do

  before do
    @user = create :user
    sign_in @user
    @subscriber = create :subscriber
  end

  it 'should get :index' do
    get :index
    expect(response).to be_success
  end

  it 'should get :edit' do
    get :edit, id: @subscriber.id
    expect(response).to be_success
  end

  it 'should put :update' do
    attrs = attributes_for :subscriber
    put :update, id: @subscriber.id, subscriber: attrs
    expect(response).to be_redirect
    subscriber = Subscriber.find_by_email attrs[:email]
    expect(subscriber).to_not be_nil
  end

  it "should delete :destroy" do
    delete :destroy, id: @subscriber.id
    expect(response).to be_redirect
    expect(Subscriber.exists? @subscriber).to be_false
  end
end
