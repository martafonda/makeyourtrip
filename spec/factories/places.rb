# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :place do
    name "MyString"
    description "MyString"
    address "MyString"
    datetime "2013-12-13 09:37:05"
    association :city
  end
end
