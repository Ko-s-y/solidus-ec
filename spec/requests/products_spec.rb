require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  describe "#show" do
    let(:product) { create(:product) }

    before do
      get potepan_product_url(product.id)
    end

    it "returns 200 response" do
      expect(response).to have_http_status(200)
    end

    it "correct product value" do
      expect(product.name).to include "Product #2 - "
      expect(product.display_price.to_s).to include "$"
    end
  end
end
