module BooksHelper

  def number_of_requests(book)
    book.requests.count
  end

end
