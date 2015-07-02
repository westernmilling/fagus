require 'rails_helper'

feature 'User views a list of categories' do
  context 'when there are not categories' do
    scenario 'the user sees a no categories message' do
      visit categories_path

      expect(page).to have_content('No categories found')
    end
  end

  context 'when there are categories' do
    let!(:categories) do
      [
        create(:category), create(:category)
      ]
    end
    scenario 'the user sees a list of categories' do
      visit categories_path

      expect(page).to have_content(categories[0].name)
      expect(page).to have_content(categories[0].reference)
      expect(page).to have_content(categories[1].name)
      expect(page).to have_content(categories[1].reference)
    end
  end
end
