require 'rails_helper'

RSpec.feature "Potepan::Categories_feature", type: :feature do
  feature "#show" do
    given(:taxon) { create(:taxon) }
    given(:taxonomy) { create(:taxonomy) }
    given(:product) { create(:product, taxons: [taxon]) }

    background do
      visit potepan_category_path(taxon.id)
    end

    scenario "correct current category path" do
      expect(page).to have_current_path potepan_category_path(taxon.id)
    end

    scenario "to /potepan" do
      expect(page).to have_link "Home", href: potepan_path
    end

    # scenario "to /potepan/products/:id" do
    #   expect(page).to have_link product.name, href: potepan_product_path(product.id)
    # end

    scenario "displayed and correct page title" do
      expect(page).to have_title "#{taxon.name} - BIGBAG Store"
    end

    scenario "accurate count number of products for each categories" do
      expect(page.all('.productBox').count).to eq taxon.products.count
    end

    # scenario "displayed and correct taxon value in categories/show" do
    #   expect(page).to have_selector ".", text: taxon.name
    # end

    # scenario "displayed and correct taxonomy value in categories/show" do
    #   expect(page).to have_selector ".panel-heading", text: "Brand"
    # end

    # scenario "displayed and correct product value in categories/show" do
    #   expect(page).to have_selector ".productCaption h5", text: product.name
    #   expect(page).to have_selector ".productCaption h3", text: product.display_price
    # end

    scenario "displayed and correct taxon value in shared/light_section" do
      expect(page).to have_selector ".col-xs-6 h2", text: taxon.name
      expect(page).to have_selector ".active", text: taxon.name
    end
  end
end

