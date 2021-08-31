class BooksController < ApplicationController

  def new

  end

  def create
    @book = Book.new(book_image_params)
    @book.user_id = current_user.id
   if @book.save
      redirect_to books_path
    else
      render :new
    end
  end

  def index
    @book = Book.new
    @book_images = Book.all
  end

  def show
    @book_image = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update
    redirect_to books_path
  end

  def destroy
    @book_image =Book.find(params[:id])
    @book_image.destroy
    redirect_to books_path
  end

  private

  def book_image_params
    params.require(:book).permit(:title, :body)
  end

end
