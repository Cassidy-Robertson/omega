class CoursesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:show]

  def index
    @courses = Course.all
  end


  def new
   @course = Course.new
  end

  def create
   @course = Course.new(course_params)
   @course.teacher = current_user
   @course.save


   redirect_to action: "index"
  end

  def show
    @course = Course.find(params[:id])
  end

  private

  def course_params
   params.require(:course).permit(:topic, :date, :time, :street, :city, :state, :zipcode, :description, :duration)
  end

end
