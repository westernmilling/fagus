require 'rails_helper'

feature 'User creates new item type' do
  context 'when the details are valid' do
    scenario 'the user sees a success message' do
      visit new_item_type_path

      fill_in :item_type_description, :with => Faker::Lorem.word
      check 'Is active'

      click_on 'Save'

      expect(page).to have_content(I18n.t('fagus.item_type.create.success'))
    end
  end

  context 'when the details are not valid' do
    scenario 'the user sees an error message' do
      visit new_item_type_path

      click_on 'Save'

      expect(page).to have_content(/error/i)
    end
  end
end
