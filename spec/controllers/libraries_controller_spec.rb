require 'rails_helper'

RSpec.describe LibrariesController, type: :controller do

  let(:library) { Library.create!(branch: 'First Library', location: 'Denver', description: 'This is the description.', image_url: nil) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [library] to @libraries" do
      get :index
      expect(assigns(:libraries)).to eq([library])
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, {id: library.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {id: library.id}
      expect(response).to have_http_status(:success)
    end
  end

end
