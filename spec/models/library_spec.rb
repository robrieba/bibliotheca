require 'rails_helper'

RSpec.describe Library, type: :model do

  #rails generate model Library branch:string location:string description:text image_url:string
  let(:library) { Library.create!(branch: 'First Library', location: 'Denver', description: 'This is the description.', image_url: nil)}

  describe 'attributes' do
    it 'has the proper attributes' do
      expect(library).to have_attributes(branch: 'First Library', location: 'Denver', description: 'This is the description.')
    end
  end

end
