# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    title
    content
    slug
    #association :author, factory: :user
  end
end
