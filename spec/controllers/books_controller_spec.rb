require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  let(:library) { Library.create!(branch: 'First Library', location: 'Denver', description: 'This is the description.', image_url: "") }
  let(:book) { library.books.create!(title: "Title", author: "Author", isbn: "0987664321", publisher: "Publisher", copies: 0, image_url: "") }

  describe "GET #new" do
    it "returns http success" do
      get :new, library_id: library.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, library_id: library.id, id: book.id
      expect(response).to have_http_status(:success)
    end
  end

end
