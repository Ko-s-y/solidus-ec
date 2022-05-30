require 'rails_helper'

RSpec.describe "Potepan::Products", type: :request do
  describe "商品ページの検証" do
    let(:product) { create(:product) }

    it "returns http success" do
      # binding.pry
      get potepan_product_path(product.id)
      expect(response).to have_http_status(:success)
    end
  end
end
