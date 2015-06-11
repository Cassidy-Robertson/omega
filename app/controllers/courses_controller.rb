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
    # require 'pry'
    # binding.pry
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    @course.update(course_params)

    redirect_to @course
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    
    redirect_to "/profiles/#{current_user.id}"
   end

  private

  def course_params
    params.require(:course).permit(:topic, :date, :time, :street, :city, :state, :zipcode, :description, :duration, :name, :tag_list)
  end

end
