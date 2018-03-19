FactoryGirl.define do
  factory :vote do
    user
    review
    upvote true
  end
end
