require 'rails_helper'

RSpec.describe "Product model of Potepanec", type: :model do
  describe "#related_products" do
    let(:taxon) { create(:taxon) }
    let(:other_taxon) { create(:taxon) }
    let(:product) { create(:product, taxons: [taxon, other_taxon]) }
    let(:other_product) { create(:product, taxons: [taxon, other_taxon]) }

    it "product is not belong to related products" do
      expect(product.related_products).not_to include product
    end

    it "related products are not duplicate" do
      expect(product.related_products).to eq product.related_products.uniq
    end

    it "order by product id asc" do
      expect(product.related_products).to eq product.related_products.sort_by(&:id)
    end
  end
end
