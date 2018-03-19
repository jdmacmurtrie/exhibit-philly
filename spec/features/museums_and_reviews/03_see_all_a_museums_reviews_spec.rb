require 'rails_helper'

feature 'Museum\'s Reviews Show' do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:user) { review.user }
  let!(:museum) { review.museum }
  let!(:review_no_body) { FactoryGirl.create(:review, museum: museum, body: nil, user: user) }
  let!(:reviews_sans_body) { FactoryGirl.create(:review, museum: museum, body: '', user: user) }

  scenario 'User visits Museum path and sees all reviews' do
    visit museum_path(museum)
    expect(page).to have_content(review.score)
    expect(page).to have_content(review.body)
    expect(page).to have_content("Score: #{review_no_body.score}")
    expect(page).to have_content("Score: #{reviews_sans_body.score}")
  end
end
