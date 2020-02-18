require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  describe "products index" do
    before do
      @category = Category.create(name: "Nikon", type: "full frame", model: 2019)
      @category1 = Category.create(name: "Canon", type: "Mirrorless", model: 2019)
      @product1 = Product.create(name: "Nikon 100", description: "Camera1", make: 2019, price: 40000, category_id: @category.id)
      @product2 = Product.create(name: "Nikon 200", description: "Camera2", make: 2020, price: 50000, category_id: @category1.id)
    end

    it "returns http success" do
      get 'index'
      expect(response).to have_http_status(:success)
    end

    it "return all the categories if params[:category] not present" do
      get 'index'
      expect(JSON.parse(response.body)).to eq([@product1.as_json, @product2.as_json])
    end
      
    it "return products of the params[:category]" do
      get 'index', params: {category: @category.name} 
      expect(JSON.parse(response.body)).to eq([@product1.as_json])
    end
  end

  describe "categories create" do
    before do
      @category = Category.create(name: "Nikon", type: "full frame", model: 2019)
      @params_hash = { "product": { "name": "Canon D450", "description": "C3", "make": 2019, "price": "39999.0", "category_id": @category.id }}
      post 'create', params: @params_hash 
    end
                                                                                                
    it "is successfull" do
      expect(response).to have_http_status(:created)
    end
                                                                                                
    it "the product is saved" do
      product = JSON.parse response.body
      expect(product["name"]).to eq(@params_hash[:product][:name])
      expect(product["description"]).to eq(@params_hash[:product][:description])
      expect(product["make"]).to eq(@params_hash[:product][:make])
      expect(product["price"]).to eq(@params_hash[:product][:price])
      expect(product["category_id"]).to eq(@params_hash[:product][:category_id])
    end
  end
end
