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
    let!(:not_related_product) { create :product, taxons: [other_taxon] }
end
