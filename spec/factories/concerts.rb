FactoryBot.define do
  factory :concert do
    sequence(:title) { |n| "Live Concert Nº #{n}" }
    sequence(:description) { |n| "Description of the Music Show Nº #{n}" }
  end
end
