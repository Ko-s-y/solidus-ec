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

    scenario "displayed and correct page title" do
      expect(page).to have_title "#{taxon.name} - BIGBAG Store"
    end

    scenario "displayed and correct taxon value in shared/light_section" do
      expect(page).to have_selector ".col-xs-6 h2", text: taxon.name
      expect(page).to have_selector ".active", text: taxon.name
    end
  end
end
