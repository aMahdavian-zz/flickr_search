class SearchController < ApplicationController
  def index
  end

  def search

    if params[:search_term].present?
      @search_term = params[:search_term]
      photos = flickr.photos.search(
        text:     @search_term,
        page:     params[:page] || 1,
        per_page: 30
      )
      @search_results = WillPaginate::Collection.create(photos.page, photos.page, photos.pages) do |pager|
        pager.replace(photos.to_a)
      end
    end    
  end
end
