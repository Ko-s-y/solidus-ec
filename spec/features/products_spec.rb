require 'rails_helper'

RSpec.feature "Potepan::Products", type: :feature do
  feature "#show" do
    given(:taxon) { create(:taxon) }
    given(:taonomy) { create(:taxonomy) }
    given(:product) { create(:product, taxon: [taxon])}

    background do
      visit potepan_category_path(taxon.id)
      visit potepan_product_path(product.id)
    end





  end
end
