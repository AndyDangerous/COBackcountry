FactoryGirl.define do
factory :user do
  name "MyString"
  email "MyString"
  provider "MyString"
  uid "MyString"

  trait :admin do
    after(:create) {|user| user.add_role(:admin)}
  end

  trait :guest do
    after(:create) {|user| user.add_role(:guest)}
  end

  trait :authorized_user do
    after(:create) {|user| user.add_role(:user)}
  end

end
