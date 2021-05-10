class BooksController < ApplicationController
  def index
   @book = Book.new
   @books = Book.all
  end

  def show
   @book = Book.find(params[:id])
  end


  def create
    @book = Book.new(book_params)
   if @book.save
    redirect_to book_path(@book)
    flash[:notice] = "Book was successfully created."
   else
    flash[:notice] = "error"
    redirect_to books_path
   end
  end

  def edit
   @book = Book.find(params[:id])
  end



  def update
    book = Book.find(params[:id])
   if book.update(book_params)
    flash[:notice] = "Book was successfully updated."
   else
    flash[:notice] = "error."
   end
    redirect_to book_path(book)
  end




  def destroy
    book = Book.find(params[:id])
   if book.destroy
    flash[:notice] = "Book was successfully destroyed."
   else
    flash[:notice] = "error."
   end
   redirect_to books_path
  end

end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


