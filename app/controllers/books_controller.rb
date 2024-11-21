class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book_all = Book.all
  end

  def show
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/'
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
