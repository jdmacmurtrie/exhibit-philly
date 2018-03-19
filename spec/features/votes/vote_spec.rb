require 'rails_helper'

xfeature "User votes" do
  let!(:review) { FactoryGirl.create(:review) }
  let!(:user) { review.user }
  let!(:museum) { review.museum }
  it 'user upvotes another review' do
    sign_in_as(user)
    visit museum_path(museum)
    click_button 'Downvote'

    expect(page).to have_content('Score: -1')
  end
end
