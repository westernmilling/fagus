require 'rails_helper'

feature 'User views an item type' do
  let(:item_type) { create(:item_type) }

  scenario 'the user sees the item type' do
    visit item_type_path(item_type)

    expect(page).to have_content('Item Type')
    expect(page).to have_content(item_type.description)
    expect(page).to have_content(item_type.active?)
    expect(page).to have_content(item_type.uuid)
  end
end
