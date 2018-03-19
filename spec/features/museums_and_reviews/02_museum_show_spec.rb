require 'rails_helper'

feature 'Museums Show' do
  let!(:museum) { FactoryGirl.create(:museum) }

  scenario 'User visits Museum show page directly' do
    visit museum_path(museum)

    expect(page).to have_content museum.name
    expect(page).to have_content museum.hours
    expect(page).to have_content museum.location
    expect(page).to have_content museum.phone_number
    expect(page).to have_content museum.website
  end
end
