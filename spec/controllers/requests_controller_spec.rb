require 'rails_helper'

RSpec.describe RequestsController, type: :controller do

  let(:library) { Library.create!(branch: 'First Library', location: 'Denver', description: 'This is the description.', image_url: "") }
  let(:book) { library.books.create!(title: "Title", author: "Author", isbn: "0987664321", publisher: "Publisher", copies: 0, image_url: "") }

  before do
    request.env["HTTP_REFERER"] = library_book_path(library, book)
  end

  describe "POST #request" do
    it "returns http redirect" do
      post :make_request, library_id: library.id, book_id: book.id
      expect(response).to have_http_status(:redirect)
    end

    it "creates a request for this book at this library" do
      post :make_request, library_id: library.id, book_id: book.id
      expect(book.requests.count).to eq(1)
    end
  end

end
