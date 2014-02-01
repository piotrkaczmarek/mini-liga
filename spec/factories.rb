FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "John_#{n}" }
    sequence(:last_name) { |n| "Smith_#{n}" }
    sequence(:email) { |n| "john_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
    phone_number 700700700
  end
 
  factory :league do
    sequence(:name) { |n| "League_#{n}" }
    sport "tenis"
    weekday 3
  end
end
