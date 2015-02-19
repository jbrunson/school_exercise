class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    redirect_to root_path
  end

  private

  def course_params
    params.require(:course).permit(:name, :period)
  end
end