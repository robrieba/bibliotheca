class RequestsController < ApplicationController
  before_action :set_library_book, only: [:make_request]

  def make_request
    @book.requests.create!(library: @library, book: @book)

    respond_to do |format|
      format.html { redirect_to :back }
      format.js
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
