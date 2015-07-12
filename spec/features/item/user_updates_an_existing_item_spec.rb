require 'rails_helper'

feature 'User updates an existing item' do
  given!(:category) { create(:category) }
  given!(:item_type) { create(:item_type) }
  # given(:item) { create(:item) }
  given(:item) { create(:item, :status => :active) }

  context 'when the details are valid' do
    scenario 'the user sees a success message' do
      visit edit_item_path(item)

      fill_in :item_description, :with => Faker::Lorem.word
      select item_type.description, :from => :item_item_type_id
      select category.description, :from => :item_category_id
      # This is "clever"
      # select (Fagus::Item.status.values - [item.status]).sample,
      #        :from => :item_status
      # This is simple
      select :discontinued, :from => :item_status

      click_on 'Save'

      expect(page).to have_content(I18n.t('fagus.item.update.success'))
    end
  end

  context 'when the details are not valid' do
    scenario 'the user sees an error message' do
      visit edit_item_path(item)

      fill_in :item_description, :with => nil

      click_on 'Save'

      expect(page).to have_content(/error/i)
    end
  end
end
