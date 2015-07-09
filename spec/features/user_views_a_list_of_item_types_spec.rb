require 'rails_helper'

feature 'User views a list of item types' do
  context 'when there are not item types' do
    scenario 'the user sees a no item types message' do
      visit item_types_path

      expect(page).to have_content('No item types found')
    end
  end

  context 'when there are item types' do
    let!(:item_types) { create_list(:item_type, 2) }

    scenario 'the user sees a list of item types' do
      visit item_types_path

      expect(page).to have_content(item_types[0].description)
      expect(page).to have_content(item_types[0].active?)
      expect(page).to have_content(item_types[1].description)
      expect(page).to have_content(item_types[1].active?)
    end
  end
end
