class BooksController < ApplicationController

  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_library

  def new
    @book = Book.new
  end

  def create
    @book = @library.books.new(book_params)

    if @book.save
      flash[:notice] = "#{@book.title} by #{@book.author} was successfully created."
      redirect_to @library
    else
      flash.now[:alert] = "Error! The book will not save."
      render :new
    end
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "#{@book.title} by #{@book.author} was updated successfully."
      redirect_to @library
    else
      flash.now[:alert] = "Error! The book will not save."
      render :edit
    end
  end

  def destroy
    if @book.destroy
      flash[:notice] = "#{@book.title} by #{@book.author} was deleted successfully."
      redirect_to @library
    else
      flash.now[:alert] = "Error! Cannot delete this book."
      render :show
    end
  end

  def

  def edit
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def set_library
    @library = Library.find(params[:library_id])
  end

  def book_params
    params.require(:book).permit(:title, :isbn, :author, :publisher, :image_url, :library_id)
  end

end
