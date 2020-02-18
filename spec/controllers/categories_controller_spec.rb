require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe "categories index" do
    before do
      @category1 = Category.create(name: "Nikon", type: "full frame", model: 2019)
      @category2 = Category.create(name: "Canon", type: "Mirrorless", model: 2019)
      get 'index'
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "return all the categories" do
      expect(JSON.parse(response.body)).to eq([@category1.as_json, @category2.as_json])
    end
  end

  describe "categories create" do
    before do
      @params_hash = { "category":{"name": "Nikon", "type": "point and shoot", "model": 2021} }
      post 'create', params: @params_hash 
    end

    it "is successfull" do
      expect(response).to have_http_status(:created)
    end

    it "the category is saved" do
      category = JSON.parse response.body
      expect(category["name"]).to eq(@params_hash[:category][:name])
      expect(category["type"]).to eq(@params_hash[:category][:type])
      expect(category["model"]).to eq(@params_hash[:category][:model])
    end
  end
end
