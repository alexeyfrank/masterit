class Web::CoursesController < Web::ApplicationController
  def show
    @course = Course.find params[:id]
  end
end
