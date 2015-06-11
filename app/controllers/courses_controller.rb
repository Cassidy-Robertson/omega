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

    @course.tag_list.add(params[:course][:tag_list], parse: true)
    
    redirect_to action: "index"
  end  

  def show
    @course = Course.find(params[:id])
    # @course = Course.teacher.name(params[:id])
  end
#whats wrong with this? How do I make it show the teacher of a course?
#why is line 27 looking for a course with the ID of a teacher? 

  private


  def course_params
    params.require(:course).permit(:topic, :date, :time, :street, :city, :state, :zipcode, :description, :duration, :name, :tag_list)
  end

end






