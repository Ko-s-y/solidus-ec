require 'rails_helper'

RSpec.describe "Product model of Potepanec", type: :model do
  describe "#related_products" do
    let!(:taxon) { create(:taxon) }
    let!(:other_taxon) { create(:taxon) }
    let!(:product) { create(:product, taxons: [taxon, other_taxon]) }
    let!(:other_product) { create(:product, taxons: [taxon, other_taxon]) }
    let!(:related_products) { create_list(:product, 4, taxons: [taxon, other_taxon]) }

    it "product is not belong to related products" do # where.not(id: id)
      expect(product.related_products).not_to include product
    end

    it "related products are not duplicate" do # distinct
      expect(product.related_products).to eq product.related_products.uniq
    end

    it "order by product id asc" do # order(id: :asc)
      expect(product.related_products).to eq product.related_products.sort_by(&:id)
    end
  end
end
