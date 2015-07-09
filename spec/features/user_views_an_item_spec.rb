require 'rails_helper'

feature 'User views an item' do
  let(:item) { create(:item) }

  scenario 'the user sees the item' do
    visit item_path(item)

    expect(page).to have_content('Item')
    expect(page).to have_content(item.description)
    expect(page).to have_content(item.reference)
    expect(page).to have_content(item.category.description)
    expect(page).to have_content(item.item_type.description)
    expect(page).to have_content(item.status)
    expect(page).to have_content(item.uuid)
  end
end
