require 'rails_helper'

RSpec.feature "Potepan::Categories_feature", type: :feature do
  feature "#show" do
    given(:taxon) { create(:taxon) }
    given(:taxonomy) { create(:taxonomy) }
    given(:product) { create(:product, taxons: [taxon]) }

    background do
      visit potepan_category_path(taxon.id)
    end

    scenario "redirect to /potepan" do
      expect(page).to have_link "Home", href: potepan_path
    end
  end
end
