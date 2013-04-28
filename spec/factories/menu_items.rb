# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item, class: 'Menu::Item' do
    name
    slug
    position
    association :menu
  end
end
