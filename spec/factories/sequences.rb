FactoryGirl.define do

  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  [:password, :first_name, :last_name,
   :slug, :title, :body, :photo, :description].each do |trait|

    sequence trait do |n|
      "#{trait}_#{n}"
    end

  end
end