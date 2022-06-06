require 'rails_helper'

RSpec.describe "Potepan::Categories_request", type: :request do
  describe "#show" do
    let(:taxon) { create(:taxon, name: "Ruby on Rails") }
    let(:product) { create(:product, taxons: [taxon]) }
    let(:taxonomy) { create(:taxonomy, name: "Brand") }

    before do
      get potepan_category_url(taxon.id)
      get potepan_product_url(product.id)
    end

    it "returns 200 response" do
      expect(response).to have_http_status(200)
    end

    it "correct product value" do
      expect(response.body).to include product.name
      expect(response.body).to include product.display_price.to_s
    end

    it "correct taxon value" do
      expect(taxon.name).to eq "Ruby on Rails"
    end

    it "correct taxonomy value" do
      expect(taxonomy.name).to eq "Brand"
    end
  end
end
