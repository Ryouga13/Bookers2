class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book_all = Book.all
    @book.user_id = user.id
  end

  def show
    @book_id = Book.find(params[:id])

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to "/books/#{@book.id}"
    else
      render :new
    end
  end

  def edit
    @book_edit = Book.find(params[:id])
  end

  def update
    @book_edit = Book.find(params[:id])
    @book_edit.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to "/books/#{@book_edit.id}"
  end

  def destroy
    book_destroy = Book.find(params[:id])
    book_destroy.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
