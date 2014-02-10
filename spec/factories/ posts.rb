# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    category nil
    title "MyString"
    body "MyText"
  end
end