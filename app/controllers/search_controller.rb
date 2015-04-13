class SearchController < ApplicationController
  def index
  end

  def search

    return if !params[:search_term].present?

    photos = flickr.photos.search(
        text:     params[:search_term],
        page:     params[:page] || 1,
        per_page: 30
      )
    @search_results = WillPaginate::Collection.create(photos.page, photos.page, photos.pages) do |pager|
       pager.replace(photos.to_a)
    end
  end
end
