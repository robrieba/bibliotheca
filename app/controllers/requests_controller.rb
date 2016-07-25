class RequestsController < ApplicationController
  before_action :set_library_book, only: [:make_request]

  def make_request
    book = @library.books.find(@book.id)
    book.requests.create!(library: @library, book: @book)

    redirect_to :back
  end

  private

  def set_library_book
    @library = Library.find(params[:library_id])
    @book = Book.find(params[:book_id])
  end

  def request_params
    params.require(:library, :book)
  end


end
