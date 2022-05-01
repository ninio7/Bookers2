class BooksController < ApplicationController

 def new
  @book = Book.new
 end

 def index
  @books = Book.all
  @book = Book.new
  @user = current_user
 end

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
   flash[:complete]="You have created book successfully."
   redirect_to book_path(@book.id)
   else
    @user = current_user
    @books = Book.all
    render :index
   end
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @newbook = Book.new
    @book_comment = BookComment.new
  end


  def destroy
   @book =  Book.find(params[:id])
   @book.destroy
   redirect_to books_path
  end

    def update
    @book = Book.find(params[:id])
    # @book.user_id = current_user.id
     if @book.update(book_params)
     flash[:complete]="You have updated book successfully."
     redirect_to book_path(@book.id)
     else
     render :edit
     end
    end

    def edit
     @book = Book.find(params[:id])
     unless @book.user == current_user
     redirect_to  books_path
     end
    end
    # if params[:id] == current_user.id
    # @book = Book.find(params[:id])
    # render action: :edit
    # else
    # @user = current_user
    # render action: :show
    # end
    # end


private

  def book_params
    params.require(:book).permit(:title,:body)
  end

  # def correct_user
  #   @book = Book.find(params[:id])
  #   @user = @book.user
  #   redirect_to(books_path) unless @user == current_user
  # end
 def correct_user
      @book = Book.find(params[:id])
    unless @book == current_user
      redirect_to user_path(current_user.id)
    end
 end



end
