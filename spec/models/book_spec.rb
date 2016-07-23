require 'rails_helper'

RSpec.describe Book, type: :model do

  #rails generate model Library branch:string location:string description:text image_url:string
  let(:library) { Library.create!(branch: 'First Library', location: 'Denver', description: 'This is the description.', image_url: nil)}
  let(:book) do
    Book.create!(title: 'Title',
                 isbn: '1234567890',
                 author: 'Art Thor',
                 publisher: 'Publisher',
                 copies: 1,
                 requests: 0,
                 library: library)
  end

  describe 'attributes' do
    it 'has the proper attributes' do
      expect(book).to have_attributes(title: 'Title', isbn: '1234567890', author: 'Art Thor', publisher: 'Publisher', copies: 1, requests: 0)
    end
  end

end
