require 'rails_helper'

feature 'User views a list of items' do
  context 'when there are not items' do
    scenario 'the user sees a no items message' do
      visit items_path

      expect(page).to have_content('No items found')
    end
  end

  context 'when there are items' do
    let!(:items) { create_list(:item, 2) }

    scenario 'the user sees a list of items' do
      visit items_path

      expect(page).to have_content(items[0].description)
      expect(page).to have_content(items[0].category.description)
      expect(page).to have_content(items[0].item_type.description)
      expect(page).to have_content(items[0].reference)
      expect(page).to have_content(items[1].description)
      expect(page).to have_content(items[1].category.description)
      expect(page).to have_content(items[1].item_type.description)
      expect(page).to have_content(items[1].reference)
    end
  end
end
