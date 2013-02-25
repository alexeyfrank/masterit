class Web::ApplicationController < ApplicationController
  include Web::AuthHelper
  include ::FlashHelper

  helper_method :current_user, :signed_in?
end
