class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def index
    @book = Book.new
    @book_all = Book.all
    @user_id = current_user
  end

  def show
    @book_id = Book.find(params[:id])
    @book = Book.new
    @user_id = @book_id.user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to "/books/#{@book.id}"
    else
    @book_all = Book.all
    @user_id = current_user
      render :index
    end
  end

  def edit
    @book_edit = Book.find(params[:id])
    unless @book_edit.user.id == current_user.id
      redirect_to books_path
    end
  end

  def update
    @book_edit = Book.find(params[:id])
    if @book_edit.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to "/books/#{@book_edit.id}"
  else
    render :edit
    end
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
