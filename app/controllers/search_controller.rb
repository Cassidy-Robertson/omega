class SearchController < ApplicationController

  def search
    @query = params[:query]
    @results = Course.where("topic ILIKE ?", "%#{@query}%")
  end

end
