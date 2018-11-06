class CommentsController < ApplicationController
  before_action :find_book, only: :create

  def create
    @comments = book.comments
    @comment = book.comments.new comment_params
    comment.user = current_user
    if comment.save
      respond_to do |format|
        format.js
      end
    end
  end

  private

  attr_reader :book, :comment

  def find_book
    @book = Book.find_by id: params[:book_id]
  end

  def comment_params
    params.require(:comment).permit :content
  end
end
