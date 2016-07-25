require 'rails_helper'

RSpec.describe Book, type: :model do

  #rails generate model Library branch:string location:string description:text image_url:string
  let(:library) { Library.create!(branch: 'First Library', location: 'Denver', description: 'This is the description.', image_url: nil)}
  let(:book) do
    library.books.create!(title: 'Title',
                 isbn: '1234567890',
                 author: 'Art Thor',
                 publisher: 'Publisher',
                 copies: 1)
  end

  it { is_expected.to have_many(:requests) }

  describe 'attributes' do
    it 'has the proper attributes' do
      expect(book).to have_attributes(title: 'Title', isbn: '1234567890', author: 'Art Thor', publisher: 'Publisher', copies: 1)
    end
  end

  describe 'requests' do
    before do
      10.times { book.requests.create! }
      @requests = book.requests.count
    end

    describe '#requests' do
      it 'has the correct number of requests' do
        expect(book.requests.count).to eq(10)
      end
    end
  end

end
