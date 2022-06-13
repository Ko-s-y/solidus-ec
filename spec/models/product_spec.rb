require 'rails_helper'

RSpec.describe "Product model of Potepanec", type: :model do
  describe "#related_products" do
    let(:taxon) { create(:taxon) }
    let(:other_taxon) { create(:taxon) }
    let(:product) { create(:product, taxons: [taxon]) }
    let(:other_product) { create(:product, taxons: [other_taxon]) }
    let(:related_products) { create_list :product, 4, taxons: [taxon] }
    let(:duplicate_related_product) { create :product, taxons: [taxon] }
    let!(:not_related_product) { create :product, taxons: [other_taxon] }

    it "product is not belong to related products" do
      expect(product.related_products).not_to include product
    end

    it "not related product is not include" do
      expect(product.related_products).not_to include not_related_product
    end

    it "related products are not duplicate" do
      expect(product.related_products).to eq product.related_products.uniq
      expect(product.related_products).not_to eq duplicate_related_product
    end

    it "order by product id asc" do
      expect(product.related_products).to eq product.related_products.sort_by(&:id)
    end
  end
end
