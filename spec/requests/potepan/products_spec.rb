require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  describe "#show" do
    let(:product) { create(:product) }

    it "returns 200 response & success" do
      get potepan_product_path(product.id)
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(200)
    end

    let(:product) { create(:product, name: "sample_product") }
    it "check product name" do
      expect(product.name).to eq "sample_product"
    end

  end
end
