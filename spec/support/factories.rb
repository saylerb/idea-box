FactoryGirl.define do

  sequence(:title) { |n| "Idea Title #{n}" }
  sequence(:body) { |n| "Idea Body #{n}" }

  factory :idea do
    title 
    body 
    quality 0
  end
end
