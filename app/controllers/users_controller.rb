class UsersController < ApplicationController


 def index
  @user = current_user
  @book =Book.new
  @users = User.all
  #ログインしている人の投稿を載せない方法を下記のように考えた
  #@users = User.where.not(name: @user.name)
 end

 def show
     @user = User.find(params[:id])
     @user_books = @user.books
     @book = Book.new
 end

 def edit
   @user = User.find(params[:id])
   if @user == current_user
     render "edit"
   else
     redirect_to user_path(current_user)
   end

 end

 def update
   @user = User.find(params[:id])

   if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to user_path(@user)
   else
    render :edit
   end
 end

 private

 def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end



end
