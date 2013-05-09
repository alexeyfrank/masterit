class Web::SubscribersController < Web::ApplicationController

  layout false
  
  def new
    attrs = { course_id: params[:course_id] }
    @subscriber = ::Web::SubscriberRegistrationType.new attrs
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
