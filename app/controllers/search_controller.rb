class SearchController < ApplicationController
  def search
    @books = Book.search(params[:title]).page(params[:page]).per(15)
    render "static_pages/home"
  end
end
