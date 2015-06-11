class SearchController < ApplicationController

  def search
    @query = params[:query]
    @results = Course.where("topic ILIKE ?", "%#{@query}%")
   end

   def zipcodesearch
    @query = params[:query]
    @zipresults = Course.where(zipcode: @query)
   end

   def datesearch
    @query = params[:query]
    @dateresults = Course.where(date: @query)
   end

  def tag_search
    @query = params[:query]
    @tag_search = Course.includes(:tags).where({:tags => {:name => @query}})
  end

end
