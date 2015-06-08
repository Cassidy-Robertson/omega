class EnrollmentsController < ApplicationController

  def create
    @enrollment = Enrollment.new
    @enrollment.course_id = params[:course_id]
    @enrollment.student_id = current_user.id
    @enrollment.save


    course = Course.find_by :id => params[:course_id]
    course.teacher.notifications.create(text: "#{current_user.name} has just joined your class, on #{course.topic}.")

    redirect_to "/profiles/#{current_user.id}"
  end

end
