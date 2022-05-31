require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  describe "#show" do
    let(:product) { create(:product, name: "sample_product", price: "10.0", description: "This is sample!") }

    it "returns 200 response & success" do
      get potepan_product_path(product.id)
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(200)
    end

    it "correct product value" do
      expect(product.name).to eq "sample_product"
      expect(product.slug).to eq "sample_product"
      expect(product.price.to_s).to eq "10.0"
      expect(product.description).to eq "This is sample!"
    end
  end
end
