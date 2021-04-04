class BooksController < ApplicationController
  def index
  @book=Book.new
  @book_each=Book.all
  end

 def top
 end

  def new
    @book=Book.new
  end

  def show
    @book=Book.find(params[:id])
  end

  def create
    @book=Book.new(book_params)
   if  @book.save
     flash[:notice]= 'Book was successfully created.'
     redirect_to book_path(@book.id)
   else
      @book_each=Book.all
      render action: :index
   end
  end

  def edit
    @new_book=Book.find(params[:id])
    @book_each=Book.all
  end

  def update
       @new_book=Book.find(params[:id])
    if @new_book.update(book_params)
      flash[:update]='Book was successfully updated.'
      redirect_to book_path(@new_book.id)
    else
      @book_each=Book.all
     render action: :edit
    end
  end

  def destroy
   book=Book.find(params[:id])
   book.destroy
   redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end