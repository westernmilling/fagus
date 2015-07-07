require 'rails_helper'

feature 'User creates new category' do
  context 'when the details are valid' do
    scenario 'the user sees a success message' do
      visit new_category_path

      fill_in :category_name, :with => Faker::Lorem.word
      fill_in :category_description, :with => Faker::Lorem.word
      fill_in :category_reference, :with => Faker::Number.number(3)

      click_on 'Save'

      expect(page).to have_content(I18n.t('fagus.category.create.success'))
    end
  end

  context 'when the details are not valid' do
    scenario 'the user sees an error message' do
      visit new_category_path

      click_on 'Save'

      expect(page).to have_content(/error/i)
    end
  end
end
