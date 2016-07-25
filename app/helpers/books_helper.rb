module BooksHelper

  def number_of_requests(library, book)
    book.requests.where(library_id: library.id).size
  end

  def library_name(book)
    book.library.name if book.library
  end

  def available_through_interlibrary_loan?(library, book)
    book.library.id != library.id
  end

  def interlibrary_loan_tag(library, book)
    " from #{book.library.branch}" if available_through_interlibrary_loan?(library, book)
  end

end
