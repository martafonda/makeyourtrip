# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :travelticket do
    origin "MyString"
    destination "MyString"
    type ""
    departure "2013-12-13 09:37:05"
    place "MyString"
  end
end
