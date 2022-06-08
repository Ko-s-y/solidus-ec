require 'rails_helper'

RSpec.describe "Products request of Potepanec", type: :request do
  describe "#show" do
    let(:taxon) { create(:taxon) }
    let(:product) { create(:product, taxons: [taxon]) }
    let(:image) { create(:image) }

    before do
      get potepan_product_url(product.id)
      product.images << image
      ActiveStorage::Current.host = request.base_url
    end

    it "returns 200 response" do
      expect(response).to have_http_status(200)
    end

    it "correct product value" do
      expect(response.body).to include product.name
      expect(response.body).to include product.display_price.to_s
      expect(response.body).to include product.description
    end

    it "get product image info" do
      product.images { |image| expect(response.body).to include image.attachment(:product) }
      product.images.all?
    end
  end
end
