class BooksController < ApplicationController
  before_action :correct_user, only: [:edit, :update]


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
      flash[:notice] = 'successfully'
      redirect_to book_path(@book)
    else
      @books = Book.all
      flash[:notice] = "error"
      render :index


    end
  end

  def index
  @user = current_user
  @book = Book.new
  @books = Book.all
  end

  def show
    @user = current_user
    @book = Book.new
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])

    if book.update(book_params)
      flash[:notice] = "successfully"
      redirect_to books_path
    else
      flash[:notice] = "error"
      render :index
    end

  end

  def destroy
    book =Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to(books_path) unless @user == current_user
  end

end
