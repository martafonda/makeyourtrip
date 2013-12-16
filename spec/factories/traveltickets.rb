# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :travelticket do
    origin "MyString"
    destination "MyString"
    type "Train"
    departure "2013-12-13 09:37:05"
    place "MyString"
    association :city
  end
end
