class BooksController < ApplicationController


  def create
    @book = Book.new(book_image_params)
    @book.user_id = current_user.id
   if @book.save
      flash[:notice] = 'successfully'
      redirect_to books_path
    else
      flash[:notice] = "error"
      render :index


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

    if book.update(book_image_params)
      flash[:notice] = "successfully"
       redirect_to books_path(book.id)
    else
      flash[:notice] = "error"
      render :index
    end

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
