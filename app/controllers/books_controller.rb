class BooksController < ApplicationController
  before_action :logged_in?, only: [:create, :edit, :update, :destroy]
  before_action :find_book, only: [:show, :update]
  before_action :find_category, only: :index

  def index
    @books = Book.order("created_at DESC")
    @categories = Category.all
  end

  def new
    @book = current_user.books.new
  end
  
  def show
    @comments = book.comments
  end

  def create
    @book = current_user.books.new(book_params)    
    if @book.save
      flash[:success] = "Create Book Successfully!!!"
      redirect_to @book
    else 
      render 'new'
    end
  end

  def edit
    @books = Book.all
  end

  def update
    if book.update_attributes book_params
      flash[:success] = "Update Book Information Successfully!!!"
      redirect_to book
    else
      flash[:fail] = "Can't Update Now. Please Try Again. (!^_^)"
      redirect_to book
    end
  end

  def change_form
    @book = Book.find_by id: params[:book_id]
    respond_to do |format|
      format.js
    end
  end

  def show_by_category
    @category = Category.find_by id: params[:category_id]
    @books = category.books
    respond_to do |format|
      format.js
    end
  end

  def generate_comment_form
    @book = Book.find_by id: params[:book_id]
    respond_to do |format|
      format.js
    end
  end

  private

  attr_reader :book, :category

  def book_params
    params.require(:book).permit(:title, :author, :issue_date, :publishing_company,:description,
    :picture,:category_id)
  end

  def find_book
    @book = Book.find_by id: params[:id]
  end

  def find_category
    @category = Category.find_by id: params[:category_id]
  end
end
