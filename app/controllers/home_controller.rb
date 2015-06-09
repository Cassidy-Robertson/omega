class HomeController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @courses = Course.all
  end

end
