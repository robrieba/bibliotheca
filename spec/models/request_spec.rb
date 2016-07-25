require 'rails_helper'

RSpec.describe Request, type: :model do

  let(:library) { Library.create!(branch: 'First Library', location: 'Denver', description: 'This is the description.', image_url: nil)}
  let(:book) do
    Book.create!(title: 'Title',
                 isbn: '1234567890',
                 author: 'Art Thor',
                 publisher: 'Publisher',
                 copies: 1,
                 library: library)
  end
  let(:request) { Request.create!(library: library, book: book)}

  it { is_expected.to belong_to(:library)  }
  it { is_expected.to belong_to(:book)  }

end
