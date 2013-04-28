class Web::SubscribersController < Web::ApplicationController

  layout false
  
  def new
    @subscriber = ::Web::SubscriberRegistrationType.new
  end

  def create
    @subscriber = ::Web::SubscriberRegistrationType.new params[:subscriber]
    if @subscriber.save
      render :text => I18n.t('views.subscribers.success_subscribe')
    else
      render :new
    end
  end
end
