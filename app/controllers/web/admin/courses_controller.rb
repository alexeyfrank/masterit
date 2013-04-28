class Web::Admin::CoursesController < Web::Admin::ApplicationController
  def index
    @courses = Course.admin
  end

  def new
    @course = ::Web::Admin::CourseEditType.new
  end

  def create
    @course = ::Web::Admin::CourseEditType.new params[:course]
    if @course.save
      flash_success
      redirect_to admin_course_path(@course)
    else
      flash_error
      render :new
    end
  end

  def edit
    @course = ::Web::Admin::CourseEditType.find params[:id]
  end

  def update
    @course = ::Web::Admin::CourseEditType.find params[:id]
    if @course.update_attributes params[:course]
      flash_success
      redirect_to admin_course_path(@course)
    else
      flash_error
      render :edit
    end
  end

  def destroy
    @course = Course.find params[:id]
    @course.destroy
    flash_success
    redirect_to admin_course_path
  end
end
