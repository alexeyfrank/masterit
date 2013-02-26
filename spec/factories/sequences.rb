FactoryGirl.define do

  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  sequence :password do |n|
    "12345"
  end

  [
      :first_name, :last_name, :name,:slug, :title,
      :content, :photo, :description
  ].each do |trait|
    sequence trait do |n|
      "#{trait}_#{n}"
    end

  end
end