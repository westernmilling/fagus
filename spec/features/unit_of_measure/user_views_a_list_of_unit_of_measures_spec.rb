require 'rails_helper'

feature 'User views a list of unit of measures' do
  context 'when there are not unit of measures' do
    scenario 'the user sees a no unit of measures message' do
      visit unit_of_measures_path

      expect(page).to have_content('No unit of measures found')
    end
  end

  context 'when there are unit of measures' do
    let!(:unit_of_measures) { create_list(:unit_of_measure, 2) }

    scenario 'the user sees a list of unit of measures' do
      visit unit_of_measures_path

      expect(page).to have_content(unit_of_measures[0].name)
      expect(page).to have_content(unit_of_measures[0].symbol)
      expect(page).to have_content(unit_of_measures[0].unit_type)
      expect(page).to have_content(unit_of_measures[1].name)
      expect(page).to have_content(unit_of_measures[1].symbol)
      expect(page).to have_content(unit_of_measures[1].unit_type)
    end
  end
end
