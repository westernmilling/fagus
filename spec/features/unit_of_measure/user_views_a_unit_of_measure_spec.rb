require 'rails_helper'

feature 'User views a unit of measure' do
  let(:unit_of_measure) { create(:unit_of_measure) }

  scenario 'the user sees the unit of measure' do
    visit unit_of_measure_path(unit_of_measure)

    expect(page).to have_content('Unit of Measure')
    expect(page).to have_content(unit_of_measure.name)
    expect(page).to have_content(unit_of_measure.symbol)
    expect(page).to have_content(unit_of_measure.unit_type)
    expect(page).to have_content(unit_of_measure.uuid)
  end
end
