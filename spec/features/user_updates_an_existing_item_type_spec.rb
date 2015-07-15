require 'rails_helper'

feature 'User updates an existing item type' do
  given(:item_type) { create(:item_type) }

  context 'when the details are valid' do
    scenario 'the user sees a success message' do
      visit edit_item_type_path(item_type)

      fill_in :item_type_description, :with => Faker::Lorem.word
      uncheck 'Is active'

      click_on 'Save'

      expect(page).to have_content(I18n.t('fagus.item_type.update.success'))
    end
  end

  context 'when the details are not valid' do
    scenario 'the user sees an error message' do
      visit edit_item_type_path(item_type)

      fill_in :item_type_description, :with => nil

      click_on 'Save'

      expect(page).to have_content(/error/i)
    end
  end
end
