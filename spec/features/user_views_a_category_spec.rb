require 'rails_helper'

feature 'User views a category' do
  let(:category) { create(:category) }

  scenario 'the user sees the category' do
    visit category_path(category)

    expect(page).to have_content('Category')
    expect(page).to have_content(category.reference)
    expect(page).to have_content(category.name)
    expect(page).to have_content(category.description)
    expect(page).to have_content(category.uuid)
    expect(page).to have_content(category.active?)
  end
end
