class SearchController < ApplicationController

  def search
    @query = params[:query][:text]
    case params[:query][:refinement]
    when "topic"
      @results = Course.where("topic ILIKE ?", "%#{@query}%")
    when "zipcode", "date"
      refinement = params[:query][:refinement]
      @results = Course.where(refinement => @query)
    end
   end

  def tag_search
    @query = params[:query]
    @tag_search = Course.includes(:tags).where({:tags => {:name => @query}})
  end

end
