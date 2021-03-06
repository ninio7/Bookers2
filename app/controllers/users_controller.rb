class UsersController < ApplicationController

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
  

   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
     flash[:complete]="You have updated user successfully."
     redirect_to user_path(@user.id)
     else
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

end





