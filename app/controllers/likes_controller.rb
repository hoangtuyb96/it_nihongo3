class LikesController < ApplicationController
  before_action :find_book
  before_action :logged_in?

  def create
    @like = current_user.likes.new book_id: params[:book_id]
    if @like.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @like = Like.find_by id: params[:id]
    if @like.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  private

  attr_reader :book

  def find_book
    @book = Book.find_by id: params[:book_id]
  end
end
