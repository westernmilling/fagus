require 'rails_helper'

feature 'User updates an existing unit of measure' do
  given(:unit_of_measure) { create(:unit_of_measure) }

  context 'when the details are valid' do
    scenario 'the user sees a success message' do
      visit edit_unit_of_measure_path(unit_of_measure)

      fill_in :unit_of_measure_name, :with => Faker::Lorem.word

      click_on 'Save'

      expect(page)
        .to have_content(I18n.t('fagus.unit_of_measure.update.success'))
    end
  end

  context 'when the details are not valid' do
    scenario 'the user sees an error message' do
      visit edit_unit_of_measure_path(unit_of_measure)

      fill_in :unit_of_measure_name, :with => nil

      click_on 'Save'

      expect(page).to have_content(/error/i)
    end
  end
end
