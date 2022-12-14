require 'rails_helper'

RSpec.feature "Categories feature of Potepanec", type: :feature do
  feature "#show" do
    given(:image) { create(:image) }
    given(:taxonomy) { create(:taxonomy) }
    given(:taxon) { create(:taxon, taxonomy: taxonomy) }
    given(:other_taxon) { create(:taxon, taxonomy: taxonomy) }
    given(:product) { create(:product, taxons: [taxon]) }
    given(:other_product) { create(:product, name: "other-product", price: "77.77", taxons: [other_taxon]) }

    background do
      product.images << image
      visit potepan_category_path(taxon.id)
    end

    scenario "correct current category path" do
      expect(page).to have_current_path potepan_category_path(taxon.id)
    end

    scenario "to /potepan" do
      expect(page).to have_link "Home", href: potepan_path
    end

    scenario "displayed and correct page title" do
      expect(page).to have_title "#{taxon.name} - BIGBAG Store"
    end

    scenario "accurate count number of products for each category" do
      expect(page.all('.productBox').count).to eq taxon.products.count
    end

    scenario "displayed count number of products for each category on sidebar" do
      expect(page).to have_selector ".sideBar", text: taxon.products.count
    end

    scenario "displayed products for each category" do
      expect(page).to have_selector ".productCaption h5", text: product.name
      expect(page).to have_selector ".productCaption h3", text: product.display_price
      expect(page).not_to have_selector ".productCaption h5", text: other_product.name
      expect(page).not_to have_selector ".productCaption h3", text: other_product.display_price
    end

    scenario "displayed products belong to chose category" do
      expect(page).to have_content product.name
      expect(page).to have_content product.display_price
      expect(page).to have_link href: potepan_product_path(product.id)
      expect(page).not_to have_content other_product.name
      expect(page).not_to have_content other_product.display_price
      expect(page).not_to have_link href: potepan_product_path(other_product.id)
    end

    scenario "displayed and correct taxon value in categories/show" do
      expect(page).to have_css('h2', text: "#{taxon.name}")
    end

    scenario "displayed and correct taxon value in shared/light_section" do
      expect(page).to have_selector ".col-xs-6 h2", text: taxon.name
      expect(page).to have_selector ".active", text: taxon.name
    end

    scenario "displayed <SHOP> in shared/light_section" do
      expect(page).to have_selector ".col-xs-6 li", text: "Shop"
    end
  end
end
