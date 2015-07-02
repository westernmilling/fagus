require 'rails_helper'

feature 'User updates an existing category' do
  given(:category) { create(:category) }

  context 'when the details are valid' do
    scenario 'the user sees a success message' do
      visit edit_category_path(category)

      fill_in :category_name, :with => Faker::Lorem.word
      fill_in :category_description, :with => Faker::Lorem.word
      # fill_in :category_reference, :with => Faker::Number.number(3)

      click_on 'Save'

      expect(page).to have_content(I18n.t('fagus.category.update.success'))
    end
  end

  context 'when the details are not valid' do
    scenario 'the user sees an error message' do
      visit edit_category_path(category)

      fill_in :category_name, :with => nil

      click_on 'Save'

      expect(page).to have_content(/error/i)
    end
  end
end
