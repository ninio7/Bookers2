class UsersController < ApplicationController

  # before_action :correct_user, only: [:edit, :update]

 def new
   @user =User.new
 end

 def create
  @user = User.new(user_params)
  @user.user_id = current_user.id
  if @user.save
   flash[:complete]="You have updated user successfully."
      redirect_to users_path
  else
   # @users = User.all
    render :index
  end
 end


  def index
     @users = User.all
     @book = Book.new
     @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

    def edit
     @user = User.find(params[:id])
     unless @user == current_user
     redirect_to  user_path(current_user.id)
     end
    end
     # unless @user == current_user
     # redirect_to  users_path
     # end
    # end
     # if params[:id] == current_user.id
     # @user = User.find(params[:id])
     # render action: :edit
     # else
     # @user = current_user
     #  render action: :show
     # end

   def update
     @user = User.find(params[:id])
      # @user = current_user
     if @user.update(user_params)
     flash[:complete]="You have updated user successfully."
     redirect_to user_path(@user.id)
     else
     # @user =User.find(params[:id])
      render :edit
     end
   end

  private

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end

   def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
   end

     # @user = @book.user
    # redirect_to(users_path) unless @user == current_user
     # redirect_to(users_path) unless current_user?(@user)
    # end
end





