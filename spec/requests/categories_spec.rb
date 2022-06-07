require 'rails_helper'

RSpec.describe "Potepan::Categories_request", type: :request do
  describe "#show" do
    let(:taxon) { create(:taxon) }
    let(:taxonomy) { create(:taxonomy) }
    let(:product) { create(:product) }
    let(:image) { create(:image) }

    before do
      taxonomy.taxons << taxon
      taxon.products << product
      product.images << image
      get potepan_category_path(taxon.id)
      ActiveStorage::Current.host = request.base_url
    end

    it "returns 200 response" do
      expect(response).to have_http_status(200)
    end

    it "correct product value" do
      expect(response.body).to include product.name
      expect(response.body).to include product.display_price.to_s
    end

    it "correct taxon value" do
      expect(response.body).to include taxon.name
    end

    it "correct taxonomy value" do
      expect(response.body).to include taxonomy.name
    end

    it "get product image info" do
      expect(response.body).to include product.images.first.attachment(:product)
    end
  end
end
