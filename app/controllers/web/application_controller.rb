class Web::ApplicationController < ApplicationController
  include Web::AuthHelper
  include Web::MenuHelper
  include ::FlashHelper


  def courses
    Course.web
  end

  def main_page?
    false
  end

  helper_method :current_user, :signed_in?, :main_page?, :courses
end
