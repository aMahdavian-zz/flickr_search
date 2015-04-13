class SearchController < ApplicationController
  def index
  end

  def search

    return if !params[:search_term].present?

    @search_results = flickr.photos.search(
        text:     params[:search_term],
        page:     1,
        per_page: 30
      )    
  end
end
