class EnrollmentsController < ApplicationController
  def create
    @enrollment = Enrollment.new
    @enrollment.course_id = params[:course_id]
    @enrollment.student_id = current_user.id
    @enrollment.save


    redirect_to "/profiles/#{current_user.id}"
  end
end
