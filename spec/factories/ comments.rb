# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    user nil
    post nil
    body "MyText"
    status "MyString"
  end
end