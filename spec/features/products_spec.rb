require 'rails_helper'

RSpec.feature "Products feature of Potepanec", type: :feature do
  feature "#show" do
    given(:image) { create(:image) }
    given(:taxonomy) { create(:taxonomy) }
    given(:taxon) { create(:taxon, taxonomy: taxonomy) }
    given(:product) { create(:product, taxons: [taxon]) }
    given(:related_products) { create_list(:product, 4, taxons: [taxon]) }

    background do
      product.images << image
      related_products.each { |related_product| related_product.images << create(:image) }
      visit potepan_product_path(product.id)
    end

    scenario "correct current product path" do
      expect(page).to have_current_path potepan_product_path(product.id)
    end

    scenario "to /potepan" do
      expect(page).to have_link "Home", href: potepan_path
    end

    scenario "to /potepan/categories/:id" do
      expect(page).to have_link '一覧ページへ戻る', href: potepan_category_path(product.taxons.first.id)
    end

    scenario "displayed and correct page title" do
      expect(page).to have_title "#{product.name} - BIGBAG Store"
    end

    scenario "displayed and correct product value in products/show" do
      expect(page).to have_selector ".media-body h2", text: product.name
      expect(page).to have_selector ".media-body h3", text: product.display_price
      expect(page).to have_selector ".media-body p", text: product.description
    end

    scenario "displayed and correct product value in shared/light_section" do
      expect(page).to have_selector ".col-xs-6 h2", text: product.name
      expect(page).to have_selector ".active", text: product.name
    end

    scenario "not displayed <SHOP> in shared/light_section" do
      expect(page).not_to have_selector ".col-xs-6 li", text: "Shop"
    end
  end
end
