require 'rails_helper'

RSpec.feature "Potepan::Products_feature", type: :feature do
  feature "#show" do
    given(:taxon) { create(:taxon) }
    given(:taxonomy) { create(:taxonomy) }
    given(:product) { create(:product, taxons: [taxon]) }

    background do
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
  end
end
