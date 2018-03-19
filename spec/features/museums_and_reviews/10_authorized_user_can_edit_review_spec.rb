require 'rails_helper'

feature 'Only authorized user can edit a review' do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:museum) { review.museum }
  let!(:user) { review.user }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario 'User cannot edit a review if not signed in' do
    visit museum_path(museum)

    expect(page).to_not have_link('Edit Review')
  end

  scenario 'User can only edit a review that does belongs to that user' do
    sign_in_as(user)
    visit museum_path(museum)

    expect(page).to have_link('Edit Review')
  end

  scenario 'User cannot edit a review that does not belong to that user' do
    sign_in_as(user2)
    visit museum_path(museum)

    expect(page).to have_no_link('Edit Review')
  end
end
