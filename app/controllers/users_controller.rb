class UsersController < ApplicationController
 def new
   @user =User.new
 end

 def create
  @user = User.new(user_params)
  @user.user_id = current_user.id
  if @user.save
   flash[:complete]="Book was successfully updated."
      redirect_to users_path
  else
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
     end


   def update
     @user = User.find(params[:id])
     if @user.update(user_params)
     flash[:complete]="Book was successfully updated."
     redirect_to user_path(@user.id)
     else
     @user =User.find(params[:id])
      render :edit
     end
   end




  private

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end

end



