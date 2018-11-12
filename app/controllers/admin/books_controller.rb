class Admin::BooksController < ApplicationController
  before_action :check_admin

  def index
    @books = Book.order("created_at DESC").page(params[:page]).per(15)
  end

  def destroy
    @book = Book.find_by id: params[:id]
    if book.present?
      if book.destroy
        redirect_to admin_books_path
      else
        redirect_to admin_books_path
      end
    else
      redirect_to admin_books_path
    end
  end

  private

  attr_reader :book

  def check_admin
    unless current_user.is_admin
      flash[:danger] = "You don't have permission to do."
      redirect_to root_path
    end
  end
end
