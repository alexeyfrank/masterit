# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :subscriber do
    email
    fio
    phone
    notify_about_center_events true
  end
end
