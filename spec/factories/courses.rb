# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    title "MyString"
    preview "MyString"
    content "MyText"
    position 1
  end
end
