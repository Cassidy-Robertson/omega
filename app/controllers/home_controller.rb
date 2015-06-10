class HomeController < ApplicationController

  skip_before_action :authenticate_user!

  def index
    @courses = Course.order("updated_at DESC").limit(4)
  end

end
