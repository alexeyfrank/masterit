class Web::Admin::SubscribersController < Web::Admin::ApplicationController
  def index
    @subscribers = Subscriber.web
  end

  def edit
    @subscriber = ::Web::Admin::SubscriberEditType.find params[:id]
  end

  def update
    @subscriber = ::Web::Admin::SubscriberEditType.find params[:id]
    if @subscriber.update_attributes params[:subscriber]
      flash_success
      redirect_to edit_admin_subscriber_path(@subscriber)
    else
      flash_error
      render :edit
    end
  end

  def destroy
    @subscriber = Subscriber.find params[:id]
    @subscriber.destroy
    flash_success
    redirect_to admin_subscribers_path
  end
end
