class SearchController < ApplicationController
  PER_PAGE = 30
  
  def index
  end

  def search

    if params[:search_term].present?
      @search_term = params[:search_term]
      photos = flickr.photos.search(
        text:     @search_term,
        page:     params[:page] || 1,
        per_page: PER_PAGE
      )
      @search_results = WillPaginate::Collection.create(photos.page, PER_PAGE, photos.total) do |pager|
        pager.replace(photos.to_a)
      end
    end    
  end
end
