require 'rails_helper'

feature 'User creates new unit of measure' do
  context 'when the details are valid' do
    scenario 'the user sees a success message' do
      visit new_unit_of_measure_path

      fill_in :unit_of_measure_name, :with => Faker::Lorem.word
      fill_in :unit_of_measure_symbol,
              :with => Faker::Lorem.word.parameterize

      click_on 'Save'

      expect(page)
        .to have_content(I18n.t('fagus.unit_of_measure.create.success'))
    end
  end

  context 'when the details are not valid' do
    scenario 'the user sees an error message' do
      visit new_unit_of_measure_path

      click_on 'Save'

      expect(page).to have_content(/error/i)
    end
  end
end
