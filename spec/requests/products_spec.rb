require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  describe "#show" do
    let(:taxon) { create(:taxon) }
    let(:product) { create(:product, taxons: [taxon]) }

    before do
      get potepan_product_url(product.id)
    end

    it "returns 200 response" do
      expect(response).to have_http_status(200)
    end

    it "correct product value" do
      expect(response.body).to include product.name
      expect(response.body).to include product.display_price.to_s
      expect(response.body).to include product.description
    end
  end
end
