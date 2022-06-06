require 'rails_helper'

RSpec.feature "Potepan::Products_feature", type: :feature do
  feature "#show" do
    given!(:taxon) { create(:taxon) }
    given!(:taxonomy) { create(:taxonomy) }
    given!(:product) { create(:product, taxons: [taxon]) }

    background do
      visit potepan_product_path(product.id)
    end

    scenario "redirect to /potepan" do
      expect(page).to have_link "Home", href: potepan_path
    end
  end
end
