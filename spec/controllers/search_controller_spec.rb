require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")      
    end
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #search" do
    it "renders the search template" do
      get :search, search_term: 'sydney'
      expect(response).to render_template("search")      
    end
    it "returns http success" do
      get :search
      expect(response).to have_http_status(:success)
    end
  end

end