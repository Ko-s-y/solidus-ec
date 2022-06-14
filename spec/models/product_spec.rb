require 'rails_helper'

RSpec.describe Potepan::ProductDecorator, type: :model do
  describe "related_products" do
    let(:taxon1) { create(:taxon) }
    let(:taxon2) { create(:taxon) }
    let(:taxon3) { create(:taxon) }
    let(:taxon4) { create(:taxon) }
    let(:other_taxon) { create(:taxon) }
    let!(:main_product) { create(:product, taxons: [taxon1, taxon2, taxon3, taxon4]) }
    let!(:related_product1) { create(:product, taxons: [taxon1, taxon2]) }
    let!(:related_product2) { create(:product, taxons: [taxon2, taxon3]) }
    let!(:related_product3) { create(:product, taxons: [taxon3, taxon4]) }
    let!(:related_product4) { create(:product, taxons: [taxon4, taxon1]) }
    let!(:not_related_product) { create(:product, taxons: [other_taxon]) }

    it "main product not to include related products" do
      expect(main_product.related_products).not_to include main_product
    end

    it "related product to include related products" do
      expect(main_product.related_products).to include related_product1
      expect(main_product.related_products).to include related_product2
      expect(main_product.related_products).to include related_product3
      expect(main_product.related_products).to include related_product4
    end

    it "not related product not to include in related products" do
      expect(main_product.related_products).not_to include not_related_product
    end

    it "related products are not duplicate" do
      expect(main_product.related_products == main_product.related_products.uniq).to be true
    end

    it "related products order the same at all time" do
      expect(main_product.related_products).to match main_product.related_products
    end
  end
end
