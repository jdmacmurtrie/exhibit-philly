require 'rails_helper'

feature 'User recieves an email' do
  let!(:museum) { FactoryGirl.create(:museum) }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "once they review a museum they get an email confirming that they did so" do
    sign_in_as(user)
    visit museum_path(museum)
    fill_in "Rating", with: "1"
    fill_in "Your Review", with: "God, some people..."
    click_button "Create Review"

    expect(page).to have_content("God, some people...")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
