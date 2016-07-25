module LibrariesHelper

  def most_requested_book(library)
    book_id = Request.most_requested_book(library)
    if book_id
      render partial: '/books/book', locals: { library: library, book: Book.find(book_id) }
    else
      "No books have been requested."
    end
  end

end
