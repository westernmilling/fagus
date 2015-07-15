require 'rails_helper'

feature 'User creates new item' do
  given!(:category) { create(:category) }
  given!(:item_type) { create(:item_type) }

  context 'when the details are valid' do
    scenario 'the user sees a success message' do
      visit new_item_path

      expect(page).to have_content(/new item/i)

      select item_type.description, :from => :item_item_type_id
      select category.description, :from => :item_category_id
      select 'active', :from => :item_status
      fill_in :item_description, :with => Faker::Lorem.word
      fill_in :item_reference, :with => Faker::Number.number(6)

      click_on 'Save'

      expect(page).to have_content(I18n.t('fagus.item.create.success'))
    end
  end

  context 'when the details are not valid' do
    scenario 'the user sees an error message' do
      visit new_item_path

      click_on 'Save'

      expect(page).to have_content(/error/i)
    end
  end
end
