class Web::ApplicationController < ApplicationController
  include Web::AuthHelper
  include Web::MenuHelper
  include ::FlashHelper

  helper_method :current_user, :signed_in?, :main_page?

end
