class CoursesController < ApplicationController

  def index
    @courses = Course.all
  end


  def new
   @course = Course.new
  end

  def create
   binding.pry
   @course = Course.new(course_params)
   @course.teacher = current_user
   @course.save


   redirect_to "/profiles/#{current_user.id}"
  end

  private

  def course_params
   params.require(:course).permit(:topic, :zipcode, :city, :state, :date, :description, :duration, :time)
  end

end
