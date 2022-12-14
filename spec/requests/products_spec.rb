require 'rails_helper'

RSpec.describe "Products request of Potepanec", type: :request do
  describe "#show" do
    let(:taxon) { create(:taxon) }
    let(:product) { create(:product, taxons: [taxon]) }
    let(:related_products) { create_list(:product, 5, taxons: [taxon]) }
    let(:image) { create(:image) }

    before do
      product.images << image
      related_products.each { |related_product| related_product.images << create(:image) }
      get potepan_product_url(product.id)
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
      expect(response.body).to include product.images.first.attachment(:large)
      expect(response.body).to include product.images.first.attachment(:small)
    end

    it "get correct value for related 4 products" do
      related_products[0..3].all? do |related_product|
        expect(response.body).to include related_product.name
        expect(response.body).to include related_product.display_price.to_s
        expect(response.body).to include related_product.images.first.attachment(:product)
      end
    end

    it "not get value 5th and subsequent related products" do
      expect(response.body).not_to include related_products[4].name
      expect(response.body).not_to include related_products[4].images.first.attachment(:product)
    end
  end
end
