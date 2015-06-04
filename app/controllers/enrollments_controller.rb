class EnrollmentsController < ApplicationController
  def create
    current_user.inspect
    @enrollment = Enrollment.new
    @enrollment.save
  

    redirect_to "/profiles/#{current_user.id}"
  end
end
