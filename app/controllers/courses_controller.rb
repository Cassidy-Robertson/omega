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
    if @course.save
     @course.tag_list.add(params[:course][:tag_list], parse: true)
     redirect_to action: "index"
    else
     flash.now[:notice] = "Invalid zipcode for the US and Canada."
     render :new
    end

  end

  def show
    @course = Course.find(params[:id])
    @tag = @course.tag_list

    @tag.each do |ind_tag|
      @ind_tag = ind_tag
      Course.includes(:tags).where({:tags => {:name => "#{ind_tag}"}})
    end


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
