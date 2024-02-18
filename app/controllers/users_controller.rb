class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = current_user
  end
  def create
  @user = User.new(user_params)
  @book = @user.books.build(book_params)
    if @user.save && @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path(@book)
    else
      redirect_to user_path(@user)
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

def index
  @user = User.new
  @users = User.all
  @book = current_user
end

private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end
end
