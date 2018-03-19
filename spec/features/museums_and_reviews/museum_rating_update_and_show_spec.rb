require 'rails_helper'

feature 'user update a musem\'s rating' do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:museum) { review.museum }
  let!(:user1) { review.user }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario 'User posts a new review which changes the rating' do
    sign_in_as(user2)
    visit museum_path(museum)
    fill_in 'Rating', with: 4
    click_button 'Create Review'
    expect(page).to have_content("Rating: 3.3")
  end
end
