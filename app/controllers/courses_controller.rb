class CoursesController < ApplicationController
  def new
   @course = Course.new
  end

  def create
   @course = Course.new(course_params)
   @course.teacher = current_user
   @course.save


   redirect_to root_path
  end

  private

  def course_params
   params.require(:course).permit(:topic)
  end

end
